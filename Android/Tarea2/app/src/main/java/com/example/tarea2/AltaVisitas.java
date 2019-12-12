package com.example.tarea2;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.ContentValues;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.CalendarView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Calendar;

public class AltaVisitas extends AppCompatActivity {

    private TextView txtReseña;
    private CalendarView cldFecha;
    private String idLugar="0";
    private String fecha="2019/01/01";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_alta_visitas);

        if(getIntent().hasExtra("idLugar")){
            idLugar=getIntent().getStringExtra("idLugar");
        }

        txtReseña = findViewById(R.id.txtReseña);
        cldFecha = findViewById(R.id.cldFecha);

        cldFecha.setOnDateChangeListener(new CalendarView.OnDateChangeListener() {
            @Override
            public void onSelectedDayChange(@NonNull CalendarView calendarView, int i, int i1, int i2) {
                if (i1<12)
                    i1++;
                String año=""+i,mes=""+i1,dia=""+i2;
                if (i1<10)
                    mes="0"+i1;
                if (i2<10)
                    dia="0"+i2;
                fecha = año+"/"+mes+"/"+dia;
            }
        });

    }

    public void guardar(View view){
        AdminSQLiteOpenHelper admin = new AdminSQLiteOpenHelper(this,"lugares",null, 1);
        SQLiteDatabase db = admin.getWritableDatabase();

        String reseña = txtReseña.getText().toString();

        if (!reseña.isEmpty()){
            ContentValues registro = new ContentValues();
            registro.put("idLugar",idLugar);
            registro.put("reseña",reseña);
            registro.put("fecha",fecha);

            db.insert("Visita",null,registro);

            Toast.makeText(this,"Registro exitoso",Toast.LENGTH_SHORT).show();

            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.YEAR,2019);
            calendar.set(Calendar.MONTH,01);
            calendar.set(Calendar.DAY_OF_MONTH,01);
            long timeinmili = calendar.getTimeInMillis();

            cldFecha.setDate(timeinmili);
            txtReseña.setText("");
            db.close();


            if (fecha.compareTo(getUltimaFecha(idLugar))>=0){
                modificarUltimaFecha();
            }

        }else{
            Toast.makeText(this,"Debes llenar todos los campos",Toast.LENGTH_SHORT).show();
        }
    }

    private void modificarUltimaFecha() {
        AdminSQLiteOpenHelper admin = new AdminSQLiteOpenHelper(this,"lugares",null, 1);
        SQLiteDatabase db = admin.getWritableDatabase();

        ContentValues registro = new ContentValues();
        registro.put("ultimaFecha",fecha);

        db.update("Lugar",registro,"id="+idLugar,null);

        db.close();
    }

    public void regresar(View view){
        Intent intent = new Intent(this,listaVisitas.class);
        intent.putExtra("idLugar",idLugar);
        startActivity(intent);
    }
    public String getUltimaFecha(String idLugar){
        String fecha="";
        AdminSQLiteOpenHelper admin = new  AdminSQLiteOpenHelper(this,"lugares",null,1);
        SQLiteDatabase db = admin.getWritableDatabase();

        Cursor fila = db.rawQuery("select ultimaFecha from Lugar where id="+idLugar,null);
        if (fila.moveToFirst()){
            fecha = fila.getString(0);
        }
        db.close();
        return fecha;
    }
}
