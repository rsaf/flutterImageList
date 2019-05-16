
This repository is a helper to reproduce the crash issue due to high memory consumption on when using images in flutter list.

It’s basically a page containing a list of images that navigate to the same page on Press event: A common use case for e-commerce recomendations.

#Steps to reproduce

1 - Navigage to the image list by clicking 'go to test page'
2 - scroll to the bottom of the list
3 - Press any image (this should navigate to this same page gain)
4 - repeat step 2 and 3 several times (about 10-20 times on Iphone 6, or other low memory devices). You can see an obvious memory increase while navigating to the page
