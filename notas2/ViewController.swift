//
//  ViewController.swift
//  notas2
//
//  Created by Laura Siliprandi on 20/10/15.
//  Copyright © 2015 Laura Abitante. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtNota1: UITextField!
    @IBOutlet weak var txtNota2: UITextField!
    @IBOutlet weak var txtNota3: UITextField!

    override func viewDidLoad() {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnCalcular(sender: AnyObject) {
        
        if(self.verificaValores()){
            
            var media: Float
            var resultadoFinal: String
            
            media = ((txtNota1.text! as NSString).floatValue + (txtNota2.text! as NSString).floatValue + (txtNota3.text! as NSString).floatValue) / 3
            
            if(media >= 7.0 && media <= 10.0){
                resultadoFinal = "APROVADO"
                resultadoFinal = "\(resultadoFinal) \n" + (NSString(format: "%.2f", media) as String)
            }
            else if(media >= 0 && media < 7.0){
                resultadoFinal = "REPROVADO"
                resultadoFinal = "\(resultadoFinal) \n" + (NSString(format: "%.2f", media) as String)
            }
            else{
                resultadoFinal = "ERRO! \n Calcule novamente."
            }
            
            let alerta = UIAlertController(title: "Resultado Final", message: resultadoFinal, preferredStyle: UIAlertControllerStyle.Alert)
            
            let btnOk = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
            
            alerta.addAction(btnOk)
            self.showDetailViewController(alerta, sender: nil)
            
            txtNota1.text = ""
            txtNota2.text = ""
            txtNota3.text = ""
        }
    }
    
    func verificaValores() -> Bool{
        let nota1 = (txtNota1.text! as NSString).floatValue
        let nota2 = (txtNota2.text! as NSString).floatValue
        let nota3 = (txtNota3.text! as NSString).floatValue
        
        var erro = ""
        
        if(nota1 > 10){
            erro += "campo 1\n"
        }
        if(nota2 > 10){
            erro += "campo 2\n"
        }
        if(nota3 > 10){
            erro += "campo 3"
        }
        
        if(erro != ""){
            let alerta = UIAlertController(title: "Verifique:", message: erro, preferredStyle: UIAlertControllerStyle.Alert)
            
            let btnOK = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
            
            alerta.addAction(btnOK)
            self.showDetailViewController(alerta, sender: nil)
            
            return false
        }
        else{
            return true
        }
    }
}

