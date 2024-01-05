package com.example.uibasics.gridview

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.AdapterView
import android.widget.GridView
import android.widget.Toast
import com.example.uibasics.R

class GridViewDemo : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_grid_view)

        val gridView = findViewById<GridView>(R.id.gridView)

        // Providing Static data to the GridView
        val flowerName = arrayOf("Rose", "Lotus", "Lily")

        val  flowerImage = intArrayOf(R.drawable.rose, R.drawable.lotus, R.drawable.lily)

        var griAdaptor = GridAdaptor(this@GridViewDemo, flowerName, flowerImage)
        gridView.setAdapter(griAdaptor)

        gridView.setOnItemClickListener(
            fun (parent:AdapterView<*>?, view: View?, position:Int, id:Long){
                Toast.makeText(this@GridViewDemo, "You clicked on"+flowerName[position],Toast.LENGTH_LONG).show()
            }
        )
    }
}