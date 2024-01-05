package com.example.uibasics.bundlepassing

import android.annotation.SuppressLint
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import com.example.uibasics.R

class BundlePassing : AppCompatActivity() {

    lateinit var   nameEt: EditText
    lateinit var  emailEt:EditText
    lateinit var passData: Button
    @SuppressLint("MissingInflatedId")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_bundle_passing)

        // To define Bundle Passing here we use bundle passing to transfer data to one screen to another screen

          nameEt  = findViewById(R.id.person_name_et)
          emailEt = findViewById(R.id.email_address_et)
          passData = findViewById(R.id.passdata)


        passData.setOnClickListener {
            getData();

            // when u click on the button the edit text field data will be deleted
            nameEt.setText(" ")
            emailEt.setText(" ")
        }
    }

     fun getData() {
        val getName = nameEt.text.toString()
         val getEmail = emailEt.text.toString()

         // create object of bundle class
         val bundle = Bundle()
         bundle.putString("name", getName)
         bundle.putString("email", getEmail)

         // Now implement Intent for passing data from one activity to another
         val intent = Intent(this@BundlePassing, DataConsumerActivity::class.java)
         intent.putExtras(bundle)
         startActivity(intent)


    }
}