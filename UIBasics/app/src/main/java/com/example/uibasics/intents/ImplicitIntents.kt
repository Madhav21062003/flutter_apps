package com.example.uibasics.intents

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import com.example.uibasics.R

class ImplicitIntents : AppCompatActivity() {
    @SuppressLint("MissingInflatedId")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_implicit_intents)

        // implicit Intent Button
        val shareDataBtn = findViewById<Button>(R.id.shareDatatBtn)
        shareDataBtn.setOnClickListener {

            // Create an intent with the action set to ACTION_SEND
            val intent = Intent(Intent.ACTION_SEND)

            // Set the type of content you want to share (e.g., text/plain, image/jpeg, etc.)
            intent.type = "text/plain"


            // Add the content you want to share
            intent.putExtra(Intent.EXTRA_TEXT, "This is the content you want to share.")


            // Create a chooser dialog to show available sharing apps
            val chooser = Intent.createChooser(intent, "Share with")

            // Start the chooser dialog
            startActivity(chooser)
        }
    }
}