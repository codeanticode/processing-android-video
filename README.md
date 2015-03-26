# Processing Video implementation for Android
In this branch, I'm maintaing another approach to render camera preview on processing's `GLSurfaceView`.
The idea is to render camera preview on a `SurfaceTexture` and as soon as the new frame is received, copy the data from this `SurfaceTexture` to a custom texure bound to target `GL_TEXTURE_2D`. 
We cannot directly render to processing's own texture because it's bound `GL_TEXTURE_2D` target, whereas for the preview to happen, the texture should be bound to `GL_TEXTURE_EXTERNAL_OES`.

**Behind the hood :**

I create a framebuffer object and a custom texture object, which is bound to target `GL_TEXTURE_2D`, and attach this texture to the previously created framebuffer at `GL_COLOR_ATTACHMENT0`. I then render SurfaceTexture's shader output to this framebuffer and it atomatically gets rendered upon the custom texture I created. I then follow the approach as being done in the Syphon library - https://github.com/Syphon/Processing/blob/master/Processing_2_0/src/codeanticode/syphon/SyphonClient.java#L271
