package com.example.workaholic.activities

import android.content.Intent
import android.os.Bundle
import android.view.View
import com.example.workaholic.R
import com.google.firebase.auth.FirebaseAuth
import kotlinx.android.synthetic.main.activity_login.*

class LoginActivity : BaseActivity(), View.OnClickListener {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)

        register_user.setOnClickListener(this)
        login_button.setOnClickListener(this)
        forgot_password.setOnClickListener(this)
    }

    override fun onClick(view:View?)
    {
        if (view !=null)
        {
            when (view.id){
                R.id.forgot_password -> {

                }
                R.id.login_button -> {
                    loginUser()
                }

                R.id.register_user -> {
                    val intent = Intent(this@LoginActivity, RegisterActivity::class.java)
                    startActivity(intent)
                }
            }
        }
    }

    private fun loginUser()
    {
        if (validateLogin())
        {
            showProgress(resources.getString(R.string.please_wait))

            val email = email_login_tv.text.toString()
            val password = password_login_tv.text.toString()

            FirebaseAuth.getInstance().signInWithEmailAndPassword(email,password).addOnCompleteListener { task ->

                hideProgress()

                if (task.isSuccessful)
                {
                    showSnackBar("You are logged in successfully",false)
                }
                else
                {
                    showSnackBar(task.exception!!.message.toString(),true)
                }
            }
        }
    }
    private fun validateLogin():Boolean
    {

            if (email_login_tv.text.isNullOrBlank()) {
                showSnackBar("Please insert a valid email", true)
                return false
            }
            else if (password_login_tv.text.isNullOrBlank()) {
                showSnackBar("Insert  a password", true)
                return false
            }
            else {
                return true
            }
    }

}