# UsefulTool
Collect some useful tools for iOS.

## SUMMARY
### DeviceIDTool  
DeviceIDTool helps you to generate unique device ID by IDFV, and save device ID to keychain.  
Note: Use pod 'UICKeyChainStore'

### UIImage+animatedGIF  
Display gif animation.(Download from internet) 

### FileWrapper  
Wrap media data from PHAsset or filePath with mimetype,fileName,content to dictionary, which return:

```
@{
	@"mimetype":@"image/png", 
	@"fileName":@"iOSImage.png",
	@"content":imageData
}
```

### ImagePickerHandler
ImagePickerHandler helps you to choose pictures from camera roll, and show camera. ImagePickerHandlerDelegate returns the media data user selected.
Note: Use pod 'CTAssetsPickerController', '~> 3.3.1'

### QLPreviewHandler
Use QuickLook.framework to preview PHAsset media data.