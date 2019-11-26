package com.example.codelab

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val mod : TheModel = TheModel()
        mod.msg = "otra cosa"
        mod.clicks = 3
    }
}
