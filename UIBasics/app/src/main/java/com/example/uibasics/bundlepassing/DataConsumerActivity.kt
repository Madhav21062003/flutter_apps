package com.example.uibasics.bundlepassing

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView
import com.example.uibasics.R

class DataConsumerActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_data_consumer)

        // here we will receive the data from BundlePassing.kt
        val showName = findViewById<TextView>(R.id.name)
        val showEmail = findViewById<TextView>(R.id.email)

        // make object of bundle class
        val bundle = intent.extras

        showName.setText(bundle!!.getString("name", "person name"))
        showEmail.setText(bundle!!.getString("email", "email address"))
    }
}