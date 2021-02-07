# W1 - Make me an interactive map

## Assignment description 
1) Answer: Describe a problem or question in your field for which spatial analysis could be applicable.

2) Answer: List 5 data layers that you think are necessary to answer your question/solve your problem. Find on the internet github.and then describe examples of two or three of your listed layers.

3) Code: Your colleague has found some ruins during a hike in the Blue Mountains and recorded the coordinates of structures on her phone(RCFeature.csv). She would like to map her points but has no computer or mapping skills. Can you make a map that she can work with using only a browser? She needs an interactive map that she can download to her computer and use straightaway.

4) Create a standalone .html map in Leaflet showing at least basic topography and relief, and load in the table of points. Make  sure she can see the FeatureID, FeatureType and Description attributes when she hovers over the point markers.

  5) Consider adding elements such as minimap() and measure() for easier map interaction

  6) Explore differentiating the markers (e.g. by size using Accuracy field)

  7) Explore the option of clustering markers with addMarkers(clusterOptions = markerClusterOptions()). Do you recommend marker clustering here?


## Answers 

1) In the BSc of cognitive science you e.g. become aquainted with the concept of spatial analysis  in relation to eye tracking experiments. With the eye tracker you can present a participant with visual stimuli and track the eye gaze of the participant during the task. 

You could e.g. test whether there is a gender difference in which parts of the face we attend to. You would then need a number of pictures of faces - and a reasonable amount of participants of both genders to be able to investigate whether general differences exist in their gaze behavior.


2) For an analysis the first layer would include the images themselves. In addition it is common to analyze eye tracking data with fixations, scan path visualizations and heat maps. The fixations are the areas of the picture where the participant has rested their gaze for a longer period of time. You could e.g. make a layer with circles at the positions of these fixations where the size of the dot corresponds to the duration of the fixation. 

By using the eye tracker you will have the fixation coordinates over time and from these you can compute the scan paths i.e. a layer with lines connecting the fixations - possibly with arrows indicating the movement direction. To further illuminate how the participant has moved his gaze you can add a layer with numbers on each fixation to indicate the order of how the particpant has moved his gaze from one fixation point to the next. 

Additionally it is common to make a layer with a heat map over the picures i.e. you colour the different areas of the picture according to the time the participant look at it: the areas of the picture that the participant spent a long time looking at will be colored red and the areas that are less looked at will be e.g. green/yellow.




Answers to question 3-7 can be found in the .rmd file in this repository. 
