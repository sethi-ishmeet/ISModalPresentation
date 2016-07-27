# ISModalPresentation
### This is an iOS Mail Compose style custom presentation controller. Follow the steps below to use it in your project.

## Steps: 
1. Copy and paste the following files in your project:
    * ISTransitioningDelegate.swift
    * ISPresentationController.swift
    * ISAnimator.swift
    
2. In your Source View Controller, create let ISTransitioningDelegate object like this:

    ``` Swift
    let isTransitioningDelegate = ISTransitioningDelegate()
    ```
    
3. Create a segue between source and destination view controller. 

4. Add this code to prepareForSegue function:

    ```Swift
    let destination = segue.destinationViewController as! SecondViewController
    destination.transitioningDelegate = isTransitioningDelegate
    destination.modalPresentationStyle = .Custom
    ```

5. Perform segue and see the animation in action. 

## Customization Options:

You can customize following options as of now. The default values of these options are given in the comments at the end of each line.

```Swift
isTransitioningDelegate.containDimmingView = false //true
isTransitioningDelegate.transformScale = 0.90 //0.92
isTransitioningDelegate.transitionDuration = 1.0 //0.8
isTransitioningDelegate.verticalOffset = 50.0 // 40.0
```
## Notes:
* The maximum value for transform scale could be 1.0 and is applied to source view controller.
* Vertical offset is offset of destination view controller from top of screen. 
* Dimming view is a dimmed view that is displayed between the source and destination view controller when destination view controller is being presented.
