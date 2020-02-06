
# coding: utf-8

# In[1]:


import numpy as np
import keras
from keras.preprocessing.image import load_img
from keras.preprocessing.image import img_to_array
from PIL import Image
from keras.applications.imagenet_utils import decode_predictions
import matplotlib.pyplot as plt
from keras import backend as K
from keras.applications import inception_v3
 
get_ipython().run_line_magic('matplotlib', 'inline')

 
filename = 'dog.jpg'
dog = load_img(filename, target_size=(299,299))
plt.imshow(dog)
plt.show()
 


# In[ ]:


#Load pretrained model (note I had to download and put in the keras models folder)

model = inception_v3.InceptionV3()

# Convert the image into batch format
numpy_image = img_to_array(dog)
numpy_image = np.expand_dims(numpy_image, axis=0)
print numpy_image.shape

#Normalize input for inception to be between -1 and 1
numpy_image /= 255.
numpy_image -= 0.5
numpy_image *= 2.

# predict and print predictions
preds = model.predict(numpy_image)
print('Predicted:', decode_predictions(preds, top=10)[0])


# In[ ]:


#turn dog into a toaster
object_type_to_fake = 859

#extract input and output layers
model_input_layer = model.layers[0].input
model_output_layer = model.layers[-1].output

#only allow image to be changed slightly at each iteration
max_change_above = numpy_image + 0.01
max_change_below = numpy_image - 0.01

#we will keep the new image in this array
hacked_image = np.copy(numpy_image)

#learning rate
learning_rate = 0.2

#cost will be probability that image is a toaster (we need to maximize)
cost_function = model_output_layer[0, object_type_to_fake]

#keras has functions to get gradients 
gradient_function = K.gradients(cost_function, model_input_layer)[0]
grab_cost_and_gradients_from_model = K.function([model_input_layer, K.learning_phase()], 
                                                [cost_function, gradient_function])

cost = 0.0

#while probability of toaster is less than .8
while cost < 0.8:
 
    #get current gradient of probability with respect to image
    cost, gradients = grab_cost_and_gradients_from_model([hacked_image, 0])

    #stochastic gradient descent update
    hacked_image += gradients * learning_rate

    #clip image so it didn't change too much and is still between -1 and 1
    hacked_image = np.clip(hacked_image, max_change_below, max_change_above)
    hacked_image = np.clip(hacked_image, -1.0, 1.0)

    print("Model's predicted likelihood that the image is a toaster: {:.8}%".format(cost * 100))


# In[ ]:


preds = model.predict(hacked_image)
print('Predicted:', decode_predictions(preds, top=10)[0])


# In[ ]:


img = hacked_image[0]
img /= 2.
img += 0.5
img *= 255.
im = Image.fromarray(img.astype(np.uint8))
plt.imshow(im)
plt.show()
im.save("toaster-dog.png")

