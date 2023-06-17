package com.example.key_app;
import android.os.Bundle;
import android.view.WindowManager;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        WindowManager.LayoutParams params = getWindow().getAttributes();
        params.setTitle("Your Message Here");
        getWindow().setAttributes(params);
    }
}
