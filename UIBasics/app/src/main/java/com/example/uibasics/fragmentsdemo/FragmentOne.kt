package com.example.uibasics.fragmentsdemo

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.navigation.NavController
import androidx.navigation.Navigation
import com.example.uibasics.R
import com.example.uibasics.databinding.FragmentOneBinding


class FragmentOne : Fragment() {

    private lateinit var binding: FragmentOneBinding

    // step -1
    // using Nav controller for fragments
    private lateinit var navController: NavController
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

    }

    // step -2
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        navController = Navigation.findNavController(view)
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        binding = FragmentOneBinding.inflate(inflater, container, false)

        binding.btnFragmentOne.setOnClickListener {
//            Toast.makeText(context, "Fragment One", Toast.LENGTH_SHORT).show()

            navController.navigate(R.id.action_fragmentOne2_to_fragmentTwo2)
        }

        return binding.root
    }

    companion object {

    }
}


