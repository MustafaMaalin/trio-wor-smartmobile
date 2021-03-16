package com.example.workaholic.activities

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.workaholic.R
import com.example.workaholic.models.User
import com.example.workaholic.utils.Constants

class UserProfileActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_user_profile)

        var userDetails : User = User()
        if(intent.hasExtra(Constants.EXTRA_USER_DETAILS))
        {
            //Get user detail from intent as Parcelable
            userDetails = intent.getParcelableExtra(Constants.EXTRA_USER_DETAILS)!!
        }
    }
}