package com.example.tarea2;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    private ListView listView;
    private ArrayList<String> lugares;
    private String idLugar="0";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        lugares =new ArrayList<String>();

        listView = (ListView)findViewById(R.id.listView);

        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, R.layout.list_item, lugares);
        listView.setAdapter(adapter);
        leerArreglo();

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int position, long id) {
                String nombre = (String) listView.getItemAtPosition(position);
                idLugar=consultaID(nombre.split(":")[0]);
                editar(idLugar);
            }
        });
    }

    public void click(View view){
        Intent intent = new Intent(this,AltaLugarActivity.class);
        startActivity(intent);
    }

    public String consultaID(String nombre){
        String id="";
        AdminSQLiteOpenHelper admin = new  AdminSQLiteOpenHelper(this,"lugares",null,1);
        SQLiteDatabase db = admin.getWritableDatabase();

        Cursor fila = db.rawQuery("select id from Lugar where nombre='"+nombre+"'",null);
        if (fila.moveToFirst()){
            id = fila.getString(0);
        }
        db.close();
        return id;
    }
    public void editar(String id){
        Intent intent = new Intent(this,AltaLugarActivity.class);
        intent.putExtra("idLugar",idLugar);
        startActivity(intent);
    }
    public void leerArreglo(){
        AdminSQLiteOpenHelper admin = new  AdminSQLiteOpenHelper(this,"lugares",null,1);
        SQLiteDatabase db = admin.getWritableDatabase();
        Cursor fila = db.rawQuery("select nombre,ubicacion,ultimaFecha from Lugar order by ultimaFecha desc",null);

        if (fila.moveToFirst()){
            do{
                String nombre = fila.getString(0);
                String ubicacion = fila.getString(1);
                String fecha = fila.getString(2);
                String[] componentes = fecha.split("/");
                String fecha2=componentes[2]+"/"+componentes[1]+"/"+componentes[0];
                lugares.add(nombre+": "+ubicacion+" - "+fecha2);
            }while (fila.moveToNext());
        }
        db.close();
    }
}
