package com.example.workaholic.activities

import android.app.Activity
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.example.workaholic.R
import com.example.workaholic.models.User
import com.example.workaholic.utils.Constants
import kotlinx.android.synthetic.main.activity_user_profile.*
import java.io.IOException
import java.net.URI
import java.util.jar.Manifest

class UserProfileActivity : BaseActivity(), View.OnClickListener {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_user_profile)

        var userDetails : User = User()
        if(intent.hasExtra(Constants.EXTRA_USER_DETAILS))
        {
            //Get user detail from intent as Parcelable
            userDetails = intent.getParcelableExtra(Constants.EXTRA_USER_DETAILS)!!
        }

        iv_user_photo.setOnClickListener(this@UserProfileActivity)
    }

    override fun onClick(v: View?) {
        if (v != null)
        {
            when (v.id)
            {
                R.id.iv_user_photo -> {
                    if (ContextCompat.checkSelfPermission(
                            this,
                            android.Manifest.permission.READ_EXTERNAL_STORAGE
                        )
                        == PackageManager.PERMISSION_GRANTED
                    ) {
                        Constants.showUserChooser(this)
                    }
                    else
                    {
                        ActivityCompat.requestPermissions(
                            this,
                            arrayOf(android.Manifest.permission.READ_EXTERNAL_STORAGE),
                            Constants.READ_STORAGE_PERMISSION_CODE
                        )
                    }
                }
            }
        }
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode == Constants.READ_STORAGE_PERMISSION_CODE)
        {
            if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED)
            {
                showSnackBar("Storage Permission Granted", false)
                Constants.showUserChooser(this)
            }
            else {
                showSnackBar("Permission Denied!",true)
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode == Activity.RESULT_OK){
            if (data != null)
            {
                try{
                    val selectedImageURI = data.data!!

                    iv_user_photo.setImageURI(Uri.parse(selectedImageURI.toString()))
                }
                catch (e: IOException){
                    showSnackBar("Image selection failed",true)
                }
            }
        }
    }
}