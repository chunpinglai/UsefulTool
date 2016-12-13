# UsefulTool
Collect some useful tools for iOS.

## SUMMARY
* DeviceIDTool  
DeviceIDTool help you to generate unique device ID by IDFV, and save device ID to keychain.
* UIImage+animatedGIF  
Display gif animation.(Download from internet)
* FileWrapper  
Wrap media data with mimetype,fileName,content to dictionary, which return:

```
@{
	@"mimetype":@"image/png", 
	@"fileName":@"iOSImage.png",
	@"content":imageData
}
```

```
+ (NSDictionary *)getVideoDataWithUploadFormat:(PHAsset *)asset; 
+ (NSDictionary *)getImageDataWithUploadFormat:(PHAsset *)asset;  
+ (NSDictionary *)getImageDataWithUploadFormatByFilePath:(NSString *)filePath;
```

