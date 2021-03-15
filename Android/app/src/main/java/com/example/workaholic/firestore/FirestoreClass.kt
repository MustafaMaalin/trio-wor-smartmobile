package com.example.workaholic.firestore

import com.example.workaholic.activities.RegisterActivity
import com.example.workaholic.models.User
import com.google.firebase.firestore.FirebaseFirestore
import com.google.firebase.firestore.SetOptions
import com.google.firebase.ktx.Firebase

class FirestoreClass {

    private val mFireStore = FirebaseFirestore.getInstance()

    fun registerUser(activity: RegisterActivity, userInfo: User)
    {
        mFireStore.collection("users").document(userInfo.id).set(userInfo, SetOptions.merge())
    }

}