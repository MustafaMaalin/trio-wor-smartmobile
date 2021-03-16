package com.example.workaholic.utils

import android.app.Activity
import android.content.Intent
import android.provider.MediaStore

object Constants {
    const val USERS: String = "users"
    const val PREFERENCES : String = "MyPreferences"
    const val LOGGED_IN_USERNAME : String = "logged_in_username"
    const val EXTRA_USER_DETAILS : String = "extra_user_details"
    const val READ_STORAGE_PERMISSION_CODE = 2
    const val IMAGE_REQUEST_CODE = 1

    fun showUserChooser(activity:Activity)
    {
        val galleryIntent = Intent(
            Intent.ACTION_PICK,
            MediaStore.Images.Media.EXTERNAL_CONTENT_URI
        )
        activity.startActivityForResult(galleryIntent, IMAGE_REQUEST_CODE)
    }
}