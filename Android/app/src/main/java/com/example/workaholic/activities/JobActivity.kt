package com.example.workaholic.activities

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.AdapterView
import android.widget.ListView
import android.widget.Toast
import com.example.workaholic.R

class JobActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_job)

    var listview = findViewById<ListView>(R.id.listView)
    var list = mutableListOf<Model>()

    list.add(Model("Plumbing", "I need someone to fix my fridge!", R.drawable.plumbing))
        list.add(Model("Plumbing", "I need someone to fix my fridge!", R.drawable.plumbing))
        list.add(Model("Plumbing", "I need someone to fix my fridge!", R.drawable.plumbing))
        list.add(Model("Plumbing", "I need someone to fix my fridge!", R.drawable.plumbing))
        list.add(Model("Plumbing", "I need someone to fix my fridge!", R.drawable.plumbing))
        list.add(Model("Plumbing", "I need someone to fix my fridge!", R.drawable.plumbing))
        list.add(Model("Plumbing", "I need someone to fix my fridge!", R.drawable.plumbing))

    listview.adapter = MyAdapter(this, R.layout.row, list)

    listview.setOnItemClickListener{
        parent: AdapterView<*>?, view: View?, position: Int, id: Long ->
        if(position == 0)
        {
            val intent = Intent(this@JobActivity, JobDescriptionActivitity::class.java)

            startActivity(intent)
        }
        if(position == 1)
        {
            Toast.makeText(this@JobActivity, "you click on Plumbing Job", Toast.LENGTH_LONG).show()
        }
        if(position == 2)
        {
            Toast.makeText(this@JobActivity, "you click on Plumbing Job", Toast.LENGTH_LONG).show()
        }
        if(position == 3)
        {
            Toast.makeText(this@JobActivity, "you click on Plumbing Job", Toast.LENGTH_LONG).show()
        }
        if(position == 4)
        {
            Toast.makeText(this@JobActivity, "you click on Plumbing Job", Toast.LENGTH_LONG).show()
        }
    }

    }
}