package com.example.uibasics.recycler_view

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.ImageView
import android.widget.TextView
import com.example.uibasics.R

class NewsActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_news2)

        val newsHeading = findViewById<TextView>(R.id.heading)
        val newsImage = findViewById<ImageView>(R.id.image)

        val bundle : Bundle?= intent.extras

        val heading = bundle!!.getString("heading");
        val image = bundle!!.getInt("imageId")

        newsHeading.text = heading
        newsImage.setImageResource(image)
    }
}