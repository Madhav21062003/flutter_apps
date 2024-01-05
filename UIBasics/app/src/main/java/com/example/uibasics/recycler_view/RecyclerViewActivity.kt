package com.example.uibasics.recycler_view

import android.annotation.SuppressLint
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import androidx.recyclerview.widget.ItemTouchHelper
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.uibasics.R

class RecyclerViewActivity : AppCompatActivity() {

    private val itemsList = ArrayList<String>()
    private lateinit var recyclerView: RecyclerView
    private lateinit var newsArrayList: ArrayList<News>
    lateinit var imageId: Array<Int>
    lateinit var heading: Array<String>


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_recycler_view)

        recyclerView = findViewById(R.id.recyclerView)

        imageId = arrayOf(
            R.drawable.lily, R.drawable.logo, R.drawable.lotus, R.drawable.rose,
            R.drawable.lily, R.drawable.logo, R.drawable.lotus, R.drawable.rose,
            R.drawable.lily, R.drawable.logo, R.drawable.lotus, R.drawable.rose
        )

        heading = arrayOf(
            "lily", "logo", "lotus", "rose",
            "lily", "logo", "lotus", "rose",
            "lily", "logo", "lotus", "rose"
        )

        recyclerView.layoutManager = LinearLayoutManager(this)
        recyclerView.setHasFixedSize(true)

        newsArrayList = arrayListOf<News>()
        getUserData();
    }

    private fun getUserData() {
        // here store the given data in the news array list to display it
        for (i in imageId.indices) {
            val news = News(imageId[i], heading[i])
            newsArrayList.add(news)
        }

        val adapter = MyAdapter(newsArrayList)

            val swipeGesture = object : SwipeGesture(){
                override fun onSwiped(viewHolder: RecyclerView.ViewHolder, direction: Int) {

                    when(direction){
                        ItemTouchHelper.LEFT -> {
                            adapter.deleteItem(viewHolder.adapterPosition)
                        }

                        ItemTouchHelper.RIGHT -> {
                            val archieveItem = newsArrayList[viewHolder.adapterPosition]
                            adapter.deleteItem(viewHolder.adapterPosition)
                            adapter.addItem(newsArrayList.size, archieveItem)
                        }
                    }

                    super.onSwiped(viewHolder, direction)
                }
            }

        recyclerView.adapter = adapter

        adapter.setOnItemClickListener(object : MyAdapter.onItemClickListener {
            override fun onItemClick(position: Int) {
//                Toast.makeText(
//                    this@RecyclerViewActivity,
//                    "You clicked on ${position}",
//                    Toast.LENGTH_LONG
//                ).show()

                // go to next activity when click on item of Recycler View
                val intent = Intent(this@RecyclerViewActivity, NewsActivity::class.java)
                intent.putExtra("heading", newsArrayList[position].heading)
                intent.putExtra("imageId",newsArrayList[position].titleImage)
                startActivity(intent)
            }

        })

    }
}