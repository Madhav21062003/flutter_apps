package com.example.uibasics.menus

import android.content.Context
import android.view.View
import android.widget.PopupMenu
import android.widget.Toast
import com.example.uibasics.R

class CustomMenu {

    fun customMenu(context: Context, view: View) {

        // this help to show popup menu when you click on the respected button
        val popUpMenu = PopupMenu(context, view)
        popUpMenu.inflate(R.menu.menu)

        popUpMenu.setOnMenuItemClickListener {
            when (it!!.itemId) {
                R.id.item1 -> {
                    Toast.makeText(context, "item 1", Toast.LENGTH_LONG).show()
                    true
                }


                R.id.item2 -> {
                    Toast.makeText(context, "item 2", Toast.LENGTH_LONG).show()
                    true
                }


                R.id.item3 -> {
                    Toast.makeText(context, "item 3", Toast.LENGTH_LONG).show()
                    true
                }

                else -> false
            }
        }

        // here we use try and catch to prevent it from crashing
        try {
            val fieldMpopup = PopupMenu::class.java.getDeclaredField("mPopup")
            fieldMpopup.isAccessible = true
            val mPopup = fieldMpopup.get(popUpMenu)
            mPopup.javaClass
                .getDeclaredMethod("setFoeceShowIcon", Boolean::class.java)
                .invoke(mPopup, true)
        } catch (e: Exception) {

        } finally {
            popUpMenu.show()
        }
    }
}