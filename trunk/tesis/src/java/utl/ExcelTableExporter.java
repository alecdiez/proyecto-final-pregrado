/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conection;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import javax.swing.JTable;
import jxl.Workbook;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.write.*;

/**
 *
 * @author manager
 */
public class ExcelTableExporter {

    private File file;
    private JTable table;
    private String nombreTab;

    public ExcelTableExporter(JTable table, File file, String nombreTab) {
        this.file = file;
        this.table = table;
        this.nombreTab = nombreTab;
    }

    public boolean export() {

        try {
            //Nuestro flujo de salida para apuntar a donde vamos a escribir
            DataOutputStream out = new DataOutputStream(new FileOutputStream(file));

            //Representa nuestro archivo en excel y necesita un OutputStream para saber donde va locoar los datos
            WritableWorkbook w = Workbook.createWorkbook(out);
            WritableSheet s = w.createSheet(nombreTab, 0);

            WritableFont NormalFont = new WritableFont(WritableFont.ARIAL, 10, WritableFont.NO_BOLD);
            WritableCellFormat NormalFormat = new WritableCellFormat(NormalFont);
            NormalFormat.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);

            WritableFont NormalFont1 = new WritableFont(WritableFont.ARIAL, 8, WritableFont.NO_BOLD);
            WritableCellFormat NormalFormat1 = new WritableCellFormat(NormalFont1);
            NormalFormat1.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);

            WritableFont EncabezadoFont = new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD);
            WritableCellFormat EncabezadoFormat = new WritableCellFormat(EncabezadoFont);
            EncabezadoFormat.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);

            NumberFormat ValoresFormat = new NumberFormat("0.00");
            WritableCellFormat ValoresFormato = new WritableCellFormat(ValoresFormat);
            ValoresFormato.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);
            ValoresFormato.setFont(NormalFont);

            DateFormat FechaFormat = new DateFormat("DD-MM-yyyy");
            WritableCellFormat FechaFormato = new WritableCellFormat(FechaFormat);
            FechaFormato.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);
            FechaFormato.setFont(NormalFont);

            Object formato = null;
            Object objeto = null;

            for (int j = 0; j < table.getRowCount(); j++) {
                for (int i = 0; i < table.getColumnCount() - 1; i++) {
                    formato = table.getValueAt(j, table.getColumnCount() - 1);

                    objeto = table.getValueAt(j, i);

                    if (formato.equals("n")) {
                        if ((i == 0) | (i == 4)) {
                            //public DateTime(int c,int r,java.util.Date d
                            String sfecha = objeto.toString();
                            sfecha = sfecha.substring(0, 10);
                            Date fecha_ev = Date.valueOf(sfecha);
                            s.addCell(new jxl.write.DateTime(i, j + 1, fecha_ev, FechaFormato));
                        } else if (i >= 5) {
                            float number = Float.valueOf(objeto.toString());
                            ValoresFormato.setFont(NormalFont);
                            s.addCell(new jxl.write.Number(i, j + 1, number, ValoresFormato));

                        } else if (i == 3) {
                            s.addCell(new Label(i, j + 1, String.valueOf(objeto), NormalFormat1));

                        } else {
                            s.addCell(new Label(i, j + 1, String.valueOf(objeto), NormalFormat));
                        }
                    } else if (formato.equals("e")) {
                        s.addCell(new Label(i, j + 1, String.valueOf(objeto), EncabezadoFormat));
                    } else if (formato.equals("f")) {
                        s.addCell(new Label(i, j + 1, String.valueOf(objeto), EncabezadoFormat));
                        if (i == 7) {
                            float number = Float.valueOf(objeto.toString());
                            ValoresFormato.setFont(EncabezadoFont);
                            s.addCell(new jxl.write.Number(i, j + 1, number, ValoresFormato));
                        } else {
                            s.addCell(new Label(i, j + 1, String.valueOf(objeto), EncabezadoFormat));
                        }
                    } else if (formato.equals("c")) {
                        if (i == 0) {
                            s.addCell(new Label(i, j + 1, String.valueOf(objeto), EncabezadoFormat));
                            s.mergeCells(0, j + 1, 7, j + 1);
                        }
                    } else {
                        s.addCell(new Label(i, j + 1, String.valueOf(objeto)));
                    }

                }


            }
//s.mergeCells(0,1, 7, 1);
//Como excel tiene muchas hojas esta crea o toma la hoja
//Coloca el nombre del "tab" y el indice del tab
//s.addCell((new Formula(12, 2, "=SUMA(K2:J2)")));
            w.write();
            //Cerramos el WritableWorkbook y DataOutputStream
            w.close();
            out.close();
            //si todo sale bien salimos de aqui con un true
            return true;

        } catch (IOException | WriteException ex) {
            ex.printStackTrace();
        }
        //Si llegamos hasta aqui algo salio mal
        return false;
    }

    public boolean export_ctacte() {

        try {
            //Nuestro flujo de salida para apuntar a donde vamos a escribir
            DataOutputStream out = new DataOutputStream(new FileOutputStream(file));

            //Representa nuestro archivo en excel y necesita un OutputStream para saber donde va locoar los datos
            WritableWorkbook w = Workbook.createWorkbook(out);
            WritableSheet s = w.createSheet(nombreTab, 0);

            WritableFont NormalFont = new WritableFont(WritableFont.ARIAL, 10, WritableFont.NO_BOLD);
            WritableCellFormat NormalFormat = new WritableCellFormat(NormalFont);
            NormalFormat.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);

            WritableFont NormalFont1 = new WritableFont(WritableFont.ARIAL, 8, WritableFont.NO_BOLD);
            WritableCellFormat NormalFormat1 = new WritableCellFormat(NormalFont1);
            NormalFormat1.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);

            WritableFont EncabezadoFont = new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD);
            WritableCellFormat EncabezadoFormat = new WritableCellFormat(EncabezadoFont);
            EncabezadoFormat.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);

            NumberFormat ValoresFormat = new NumberFormat("0.00");
            WritableCellFormat ValoresFormato = new WritableCellFormat(ValoresFormat);
            ValoresFormato.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);
            ValoresFormato.setFont(NormalFont);

            DateFormat FechaFormat = new DateFormat("DD-MM-yyyy");
            WritableCellFormat FechaFormato = new WritableCellFormat(FechaFormat);
            FechaFormato.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);
            FechaFormato.setFont(NormalFont);

            Object formato = null;
            Object objeto = null;

            for (int i = 0; i < table.getColumnCount(); i++) {
                objeto = table.getColumnName(i);
                s.addCell(new Label(i, 0, String.valueOf(objeto), EncabezadoFormat));
            }
            for (int j = 0; j < table.getRowCount(); j++) {
                for (int i = 0; i < table.getColumnCount(); i++) {
                    formato = table.getValueAt(j, table.getColumnCount() - 1);
                    objeto = table.getValueAt(j, i);

                    if ((table.getColumnName(i).toString().equals("F_Emision")) | (table.getColumnName(i).toString().equals("F_Vencimiento"))) {
                        /*String sfecha = objeto.toString();
                         Date fecha_ev = Date.valueOf(sfecha);
                         s.addCell(new jxl.write.DateTime(i, j+1,fecha_ev,FechaFormato));*/
                        s.addCell(new Label(i, j + 1, String.valueOf(objeto), NormalFormat));
                    } else if (table.getColumnName(i).toString().equals("Tipo")) {
                        s.addCell(new Label(i, j + 1, String.valueOf(objeto), NormalFormat));
                    } else if (table.getColumnName(i).toString().equals("Numero")) {
                        s.addCell(new Label(i, j + 1, String.valueOf(objeto), NormalFormat));
                    } else if (table.getColumnName(i).toString().equals("CondicionVenta")) {
                        s.addCell(new Label(i, j + 1, String.valueOf(objeto), NormalFormat1));
                    } else if (table.getColumnName(i).toString().equals("Dias_Retraso")) {
                        s.addCell(new Label(i, j + 1, String.valueOf(objeto), NormalFormat));
                    } else if ((table.getColumnName(i).toString().equals("Debe")) | (table.getColumnName(i).toString().equals("Haber"))) {
                        float number = Float.valueOf(objeto.toString());
                        ValoresFormato.setFont(NormalFont);
                        s.addCell(new jxl.write.Number(i, j + 1, number, ValoresFormato));
                    } else if (table.getColumnName(i).toString().equals("Saldo")) {
                        float number = Float.valueOf(objeto.toString());
                        ValoresFormato.setFont(EncabezadoFont);
                        s.addCell(new jxl.write.Number(i, j + 1, number, ValoresFormato));
                    } else {
                        s.addCell(new Label(i, j + 1, String.valueOf(objeto)));
                    }

                }


            }
            s.addCell(new Label(table.getColumnCount() - 2, table.getRowCount() + 1, "Saldo", EncabezadoFormat));
            //Object pepe = table.getValueAt(table.getColumnCount()-1,table.getRowCount()-1);
            float number1 = Float.valueOf(table.getValueAt(table.getRowCount() - 1, table.getColumnCount() - 1).toString());
            ValoresFormato.setFont(EncabezadoFont);
            s.addCell(new jxl.write.Number(table.getColumnCount() - 1, table.getRowCount() + 1, number1, ValoresFormato));

//s.mergeCells(0,1, 7, 1);
//Como excel tiene muchas hojas esta crea o toma la hoja
//Coloca el nombre del "tab" y el indice del tab
//s.addCell((new Formula(12, 2, "=SUMA(K2:J2)")));
            w.write();
            //Cerramos el WritableWorkbook y DataOutputStream
            w.close();
            out.close();
            //si todo sale bien salimos de aqui con un true
            return true;

        } catch (IOException | WriteException ex) {
            ex.printStackTrace();
        }
        //Si llegamos hasta aqui algo salio mal
        return false;
    }

    public boolean export_pendientes() {

        try {
            //Nuestro flujo de salida para apuntar a donde vamos a escribir
            DataOutputStream out = new DataOutputStream(new FileOutputStream(file));

            //Representa nuestro archivo en excel y necesita un OutputStream para saber donde va locoar los datos
            WritableWorkbook w = Workbook.createWorkbook(out);
            WritableSheet s = w.createSheet(nombreTab, 0);

            WritableFont NormalFont = new WritableFont(WritableFont.ARIAL, 10, WritableFont.NO_BOLD);
            WritableCellFormat NormalFormat = new WritableCellFormat(NormalFont);
            NormalFormat.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);

            WritableFont NormalFont1 = new WritableFont(WritableFont.ARIAL, 8, WritableFont.NO_BOLD);
            WritableCellFormat NormalFormat1 = new WritableCellFormat(NormalFont1);
            NormalFormat1.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);

            WritableFont EncabezadoFont = new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD);
            WritableCellFormat EncabezadoFormat = new WritableCellFormat(EncabezadoFont);
            EncabezadoFormat.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);

            NumberFormat ValoresFormat = new NumberFormat("0");
            WritableCellFormat ValoresFormato = new WritableCellFormat(ValoresFormat);
            ValoresFormato.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);
            ValoresFormato.setFont(NormalFont);

            DateFormat FechaFormat = new DateFormat("DD-MM-yyyy");
            WritableCellFormat FechaFormato = new WritableCellFormat(FechaFormat);
            FechaFormato.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);
            FechaFormato.setFont(NormalFont);

            Object formato = null;
            Object objeto = null;

            for (int i = 0; i < table.getColumnCount(); i++) {
                objeto = table.getColumnName(i);
                s.addCell(new Label(i, 0, String.valueOf(objeto), EncabezadoFormat));
            }
            for (int j = 0; j < table.getRowCount(); j++) {
                for (int i = 0; i < table.getColumnCount(); i++) {
                    formato = table.getValueAt(j, table.getColumnCount() - 1);
                    objeto = table.getValueAt(j, i);

                    if ((table.getColumnName(i).toString().equals("Fecha"))) {
                        /*String sfecha = objeto.toString();
                         Date fecha_ev = Date.valueOf(sfecha);
                         s.addCell(new jxl.write.DateTime(i, j+1,fecha_ev,FechaFormato));*/
                        s.addCell(new Label(i, j + 1, String.valueOf(objeto), NormalFormat));
                    } else if (table.getColumnName(i).toString().equals("Código_Nestor_Fazio")) {
                        s.addCell(new Label(i, j + 1, String.valueOf(objeto), NormalFormat));
                    } else if (table.getColumnName(i).toString().equals("Descripción")) {
                        s.addCell(new Label(i, j + 1, String.valueOf(objeto), NormalFormat));
                    } else if (table.getColumnName(i).toString().equals("Pendiente")) {
                        float number = Float.valueOf(objeto.toString());
                        ValoresFormato.setFont(NormalFont);
                        s.addCell(new jxl.write.Number(i, j + 1, number, ValoresFormato));
                        //s.addCell(new Label(i, j+1, String.valueOf(objeto.toString()),NormalFormat));
                    } else if (table.getColumnName(i).toString().equals("Estado")) {
                        s.addCell(new Label(i, j + 1, String.valueOf(objeto), NormalFormat));
                    }

                }


            }
           // s.addCell(new Label(table.getColumnCount() - 1, table.getRowCount() + 2, pendientes_f.salida_l.getText(), EncabezadoFormat));

            /*float number1 = Float.valueOf(table.getValueAt(table.getColumnCount()-1,table.getRowCount()-1).toString());
             ValoresFormato.setFont(EncabezadoFont);
             s.addCell(new jxl.write.Number(table.getColumnCount()-1, table.getRowCount()+1,number1,ValoresFormato));*/

//s.mergeCells(0,1, 7, 1);
//Como excel tiene muchas hojas esta crea o toma la hoja
//Coloca el nombre del "tab" y el indice del tab
//s.addCell((new Formula(12, 2, "=SUMA(K2:J2)")));
            w.write();
            //Cerramos el WritableWorkbook y DataOutputStream
            w.close();
            out.close();
            //si todo sale bien salimos de aqui con un true
            return true;

        } catch (IOException | WriteException ex) {
            ex.printStackTrace();
        }
        //Si llegamos hasta aqui algo salio mal
        return false;
    }

    public boolean export_comprobantes() {

        try {
            //Nuestro flujo de salida para apuntar a donde vamos a escribir
            DataOutputStream out = new DataOutputStream(new FileOutputStream(file));

            //Representa nuestro archivo en excel y necesita un OutputStream para saber donde va locoar los datos
            WritableWorkbook w = Workbook.createWorkbook(out);
            WritableSheet s = w.createSheet(nombreTab, 0);

            WritableFont NormalFont = new WritableFont(WritableFont.ARIAL, 10, WritableFont.NO_BOLD);
            WritableCellFormat NormalFormat = new WritableCellFormat(NormalFont);
            NormalFormat.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);

            WritableFont NormalFont1 = new WritableFont(WritableFont.ARIAL, 8, WritableFont.NO_BOLD);
            WritableCellFormat NormalFormat1 = new WritableCellFormat(NormalFont1);
            NormalFormat1.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);

            WritableFont EncabezadoFont = new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD);
            WritableCellFormat EncabezadoFormat = new WritableCellFormat(EncabezadoFont);
            EncabezadoFormat.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);

            NumberFormat ValoresFormat = new NumberFormat("0");
            WritableCellFormat ValoresFormato = new WritableCellFormat(ValoresFormat);
            ValoresFormato.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);
            ValoresFormato.setFont(NormalFont);

            DateFormat FechaFormat = new DateFormat("DD-MM-yyyy");
            WritableCellFormat FechaFormato = new WritableCellFormat(FechaFormat);
            FechaFormato.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);
            FechaFormato.setFont(NormalFont);

            Object formato = null;
            Object objeto = null;

            for (int i = 0; i < table.getColumnCount(); i++) {
                objeto = table.getColumnName(i);
                s.addCell(new Label(i, 0, String.valueOf(objeto), EncabezadoFormat));
            }
            for (int j = 0; j < table.getRowCount(); j++) {
                for (int i = 0; i < table.getColumnCount(); i++) {
                    formato = table.getValueAt(j, table.getColumnCount() - 1);
                    objeto = table.getValueAt(j, i);

                    if ((table.getColumnName(i).toString().equals("Total"))) {
                        /*String sfecha = objeto.toString();
                         Date fecha_ev = Date.valueOf(sfecha);
                         s.addCell(new jxl.write.DateTime(i, j+1,fecha_ev,FechaFormato));*/
                        s.addCell(new Label(i, j + 1, String.valueOf(objeto), EncabezadoFormat));
                    } else {

                        s.addCell(new Label(i, j + 1, String.valueOf(objeto), NormalFormat));
                    }
                }


            }

            w.write();
            //Cerramos el WritableWorkbook y DataOutputStream
            w.close();
            out.close();
            //si todo sale bien salimos de aqui con un true
            return true;

        } catch (IOException | WriteException ex) {
            ex.printStackTrace();
        }
        //Si llegamos hasta aqui algo salio mal
        return false;
    }
}
