# My SDDM rice
This is a login page with Material 3 design for sddm-based login services in linux which uses QML with a custom designed passsword box.
# Screenshot
<img width="1920" height="1200" alt="image" src="https://github.com/user-attachments/assets/c884fca0-360d-4c7c-984b-68f223e0da1c" />

# How to install
This is just the very beginning of this rice and I'll update it until the full optimization for end-user usage. For now, just replace the content in one of the SDDM themes located at /usr/share/sddm/themes and select it as your current SDDM theme. You can also put the background image in a subfolder such as /usr/share/sddm/themes/{Your theme}/backgrounds/bg.png or change the "background" component in Main.qml according.
# TO-DO
- [x] Animate the password box
- [ ] Remove unnecessary leftovers from the initial commit 
- [ ] Add power options and session selector
- [ ] Caps-lock indicator
- [ ] Install script
