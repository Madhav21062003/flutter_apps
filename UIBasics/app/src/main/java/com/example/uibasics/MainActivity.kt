package com.example.uibasics

import android.annotation.SuppressLint
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.ImageButton
import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import androidx.recyclerview.widget.RecyclerView
import com.example.uibasics.bundlepassing.BundlePassing
import com.example.uibasics.fragmentsdemo.FragmentActivity
import com.example.uibasics.fragmentsdemo.FragmentNavigationActivity
import com.example.uibasics.gridview.GridViewDemo
import com.example.uibasics.intents.ImplicitIntents
import com.example.uibasics.menus.CustomMenu
import com.example.uibasics.recycler_view.RecyclerViewActivity
import com.example.uibasics.webview.WebViewActivity

class MainActivity : AppCompatActivity() {

    // Creating Object of custom Menu class
    val customMenu = CustomMenu()
    @SuppressLint("MissingInflatedId", "WrongViewCast")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Menu
        val showPopUpBtn = findViewById<ImageButton>(R.id.iv_popupmenu)

        showPopUpBtn.setOnClickListener {
            customMenu.customMenu(this,it)
        }


        // Alert Dialogs
        val showDialog = findViewById<Button>(R.id.dialogBtn)

        showDialog.setOnClickListener {
            showDefaultDialog()
        }

        // Go to web view activity
        val webView = findViewById<Button>(R.id.webViewButton)
        webView.setOnClickListener{
            startActivity(Intent(this, WebViewActivity::class.java))
            finish()
        }

        // Go To Grid View
        val gridView = findViewById<Button>(R.id.gridViewBtn)

        gridView.setOnClickListener{
            startActivity(Intent(this, GridViewDemo::class.java))
        }

        // Recycler View
        val rv = findViewById<Button>(R.id.recyclerViewDemo)

        rv.setOnClickListener{
            startActivity(Intent(this@MainActivity, RecyclerViewActivity::class.java))
        }

        // fragments View
        val fragmentsView = findViewById<Button>(R.id.fragments)
        fragmentsView.setOnClickListener {
            startActivity(Intent(this@MainActivity, FragmentActivity::class.java))
        }

        // Navigation Graph in Android
        val navController = findViewById<Button>(R.id.navController)
        navController.setOnClickListener {
            startActivity(Intent(this@MainActivity, FragmentNavigationActivity::class.java))
        }

        // Implicit Intents
        val implicitIntent = findViewById<Button>(R.id.implicitIntent)
        implicitIntent.setOnClickListener {
            startActivity(Intent(this@MainActivity, ImplicitIntents::class.java))
        }

        // Use Bundle Passing
        val bundlePassing = findViewById<Button>(R.id.bundlePassing)
        bundlePassing.setOnClickListener {
            startActivity(Intent(this@MainActivity, BundlePassing::class.java))
        }
    }

    // Function to Display Show Dialog Box
    private fun showDefaultDialog() {
        val dialog = AlertDialog.Builder(this)
        dialog.setTitle("Delete Files")
        dialog.setMessage("Are you sure to Delete this file")
        dialog.setIcon(R.drawable.baseline_delete_24)
        dialog.setCancelable(false)

        dialog.setPositiveButton("Yes"){dialogInterface, which ->
            Toast.makeText(this, "Deleted", Toast.LENGTH_SHORT).show()
        }

        dialog.setNegativeButton("No"){dialogInterface, which ->
            Toast.makeText(this, "Canceled", Toast.LENGTH_SHORT).show()
        }

        dialog.setNeutralButton("Cancel"){dialogInterface, which ->
            Toast.makeText(this, "Click Cancel", Toast.LENGTH_SHORT).show()
        }
        dialog.show()
    }
}