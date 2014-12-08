# For more information about each property, visit the GitHub documentation: https://github.com/krausefx/deliver
# Everything next to a # is a comment and will be ignored

email 'dukerson@gmail.com'
# hide_transporter_output # remove the '#' in the beginning of the line, to hide the output while uploading


########################################
# App Metadata
########################################

# The app identifier is required
app_identifier "com.jmduke.Barback"
apple_id "829469529"


# This folder has to include one folder for each language
# More information about automatic screenshot upload: 
screenshots_path "./deliver/screenshots/"


# version '1.2' # you can pass this if you want to verify the version number with the ipa file
version '2.3'
config_json_folder './deliver'


########################################
# Building and Testing
########################################

# Dynamic generation of the ipa file
# I'm using Shenzhen by Mattt, but you can use any build tool you want
# Remove the whole block if you do not want to upload an ipa file
# ipa do
    # Add any code you want, like incrementing the build 
    # number or changing the app identifier

    # Attention: When you return a valid ipa file, this file will get uploaded and released
    # If you only want to upload app metadata, remove the complete ipa block.

    # system("ipa build") # build your project using Shenzhen
    #"./BarbackSwift.ipa" # Tell 'Deliver' where it can find the finished ipa file
# end

# ipa "./latest.ipa" # this can be used, if you prefer manually building the ipa file

# unit_tests do
#   system("xctool test")
# end

success do
  system("say 'Successfully deployed a new version.'")
end
