package com.example.uibasics.fragmentsdemo

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.FrameLayout
import com.example.uibasics.R

class FragmentActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_fragment)

        val frame = findViewById<FrameLayout>(R.id.frame)

        // final done

        val btn1 = findViewById<Button>(R.id.btn1)
        val btn2 = findViewById<Button>(R.id.btn2)

        // Create fragment manager
        var manager = supportFragmentManager
        var transaction = manager.beginTransaction()  // Start Transaction
        transaction.replace(R.id.frame, FragmentOne()) // what transaction
        transaction.addToBackStack(null)
        transaction.commit()

        btn1.setOnClickListener {
            // Create fragment manager
            var manager = supportFragmentManager
            var transaction = manager.beginTransaction()  // Start Transaction
            transaction.replace(R.id.frame, FragmentOne()) // what transaction
            transaction.addToBackStack(null)
            transaction.commit()
        }

        btn2.setOnClickListener {
            // Create fragment manager
            var manager = supportFragmentManager
            var transaction = manager.beginTransaction()  // Start Transaction
            transaction.replace(R.id.frame, FragmentTwo()) // what transaction
            transaction.addToBackStack(null)
            transaction.commit()
        }

    }
}