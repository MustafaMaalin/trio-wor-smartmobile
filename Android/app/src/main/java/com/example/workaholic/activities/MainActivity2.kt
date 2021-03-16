package com.example.workaholic.activities

import android.content.pm.PackageManager
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import com.example.workaholic.R
import com.google.android.gms.location.FusedLocationProviderClient
import com.google.android.gms.location.LocationServices
import java.util.jar.Manifest


class MainActivity2 : AppCompatActivity()  {
//    var btLocation: Button? = null
//    var textView1: TextView? = null
//    var textView2: TextView? = null
//    var textView3: TextView? = null
//    var textView4: TextView? = null
//    var textView5: TextView? = null
//    var fusedLocationProviderClient: FusedLocationProviderClient? = null

    lateinit var fusedLocationProviderClient: FusedLocationProviderClient

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        fusedLocationProviderClient = LocationServices.getFusedLocationProviderClient(this)

        findViewById<Button>(R.id.bt_get_location).setOnClickListener {
            fetchLocation()
        }

    }

    private fun fetchLocation() {
        val task = fusedLocationProviderClient.lastLocation

        if(ActivityCompat.checkSelfPermission(this, android.Manifest.permission.ACCESS_FINE_LOCATION)
            != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(this, android.Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED
        ){
            ActivityCompat.requestPermissions(this, arrayOf(android.Manifest.permission.ACCESS_FINE_LOCATION), 101)
            return
        }
        task.addOnSuccessListener {
            if(it != null){
                Toast.makeText(applicationContext,"${it.latitude} ${it.longitude}", Toast.LENGTH_SHORT).show()
            }
        }
    }

}
//
//        //Assign variable
//        btLocation = findViewById(R.id.bt_location);
//        textView1 = findViewById(R.id.text_view1);
//        textView2 = findViewById(R.id.text_view2);
//        textView3 = findViewById(R.id.text_view3);
//        textView4 = findViewById(R.id.text_view4);
//        textView5 = findViewById(R.id.text_view5);
//
//        //Initialize fusedLocationProviderClient
//        fusedLocationProviderClient = LocationServices.getFusedLocationProviderClient(this);
//
//        btLocation.setOnClickListener(new View.OnclickListener() {
//            @Override
//            public void onClick(View v) {
//                //Check permission
//                if (ActivityCompat.checkSelfPermission(MainActivity.this
//                                , Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED)
//                {
//                    getLocation()
//                }
//                else {
//                    ActivityCompat.requestPermissions(MainActivity.this
//                            ,new String[]{Manifest.permission.ACCESS_FINE_LOCATION}, 44);
//                }
//
//            }
//        });

