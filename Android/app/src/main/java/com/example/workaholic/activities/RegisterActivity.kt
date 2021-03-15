package com.example.workaholic.activities

import android.os.Bundle
import android.widget.Toast
import com.example.workaholic.R
import com.example.workaholic.models.User
import com.google.android.gms.tasks.OnCompleteListener
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.auth.FirebaseUser
import kotlinx.android.synthetic.main.activity_login.*
import kotlinx.android.synthetic.main.activity_register.*
import kotlinx.android.synthetic.main.activity_register.view.*

class RegisterActivity : BaseActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_register)

        register_butt.setOnClickListener {
                register()
        }

    }


    private fun register() {

        if (validateRegistration())
        {
            showProgress(resources.getString(R.string.please_wait))

            val password: String = password_reg.text.toString()
            val email: String = email_reg.text.toString()


            FirebaseAuth.getInstance().createUserWithEmailAndPassword(email, password)
                    .addOnCompleteListener(OnCompleteListener { task ->

                        hideProgress()

                        if (task.isSuccessful) {
                            val firebaseUser: FirebaseUser = task.result!!.user!!
                            val user = User(
                                    firebaseUser.uid,
                                    first_name_reg.text.toString(),
                                    last_name_reg.text.toString(),
                                    email_reg.text.toString()
                            )
                            //showSnackBar("Registration success! User id is ${firebaseUser.uid}", false)

                            FirebaseAuth.getInstance().signOut()
                            finish()
                        } else {
                            showSnackBar("Registration failed! ${task.exception!!.message.toString()}", true)
                        }
                    })
        }
    }

    private fun validateRegistration(): Boolean {
        if (email_reg.text.isNullOrBlank()) {
            showSnackBar("Please insert a valid email", true)
            return false
        }
        else if (password_reg.text.isEmpty()) {
            showSnackBar("Select a password", true)
            return false
        }
        else {
           return true
        }

    }

    fun userRegistrationSuccess()
    {
        hideProgress()

        Toast.makeText(this@RegisterActivity,
                "You are registered successfully",
                Toast.LENGTH_SHORT)
                .show()
    }
}