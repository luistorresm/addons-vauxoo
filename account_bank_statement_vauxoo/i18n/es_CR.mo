��    j      l  �   �      	     	     	     -	     :	     L	  k   _	  %   �	     �	     
     
     *
     1
     ?
     N
  +   S
     
  <   �
     �
     �
     �
     �
  <     V   >     �  S   �                 :   &     a     g     �     �  {   �     )     .  }   4     �     �  z   �     R  i   e  J   �          :     W  L   n     �  �   �  �   �  �   1          &  *   .     Y     b  (   |     �     �     �     �     �     �  
   �     	  �        �     �     �     �     �  &   �          "  x   5     �  	   �     �     �     �  4   �  <   3  �   p  A   �  4   6  �   k  f   &  F   �  G  �  	        &     3      ?     `     i  1   q  E   �  <   �  3   &  T   Z  �  �  f  z:  �   �Y     �Z     �Z  8  �Z     �[     �[     �[     \     \  f   /\  $   �\     �\     �\     �\     ]     ]     ]     +]  3   0]  	   d]  F   n]     �]     �]  	   �]     �]  O   �]  f   J^  )   �^  n   �^     J_     Q_     W_  B   t_     �_  2   �_  $   �_     `  �   #`     �`     �`  }   �`     `a     pa  �   �a     b  z   4b  J   �b     �b  !   c     <c  O   [c  &   �c  �   �c  �   �d    ve     }f     �f  4   �f     �f     �f  )   �f     g     $g     6g     ?g  #   Pg  #   tg     �g     �g  �   �g     Nh     \h     ch     {h     �h  5   �h  '   �h     �h  �   i     �i     �i  $   �i     �i     �i  7   j  =   Mj     �j  M   k  5   Yk  �   �k  �   9l  E   �l  u  m     |n     �n     �n      �n     �n     �n  5   �n  Y   o  3   fo  +   �o  l   �o  �  3p  f  ��  �   e�     7�     Q�                         V   [   H   J      D      h   N      B   /   A      e      "          W   L           !   Y         $              0      U   #          (   c   Q      R   )       T   C       7   K   +                d       '   F   <   O   :       .       ?   X   f                 i           *           6   %   9               @   ]               ,       &   E   5   I          -   P           `   \          Z       a   G           ^   8   M   g       
   1           4   2                  _   3   >      S          b       ;              j   =   	       Account Account Counterpart Account Move Account Move Line Account Move Lines Account Move Temporary For this Statement                                     Id Was Created is created %s  Account Move Temporary is created %s  Bank Imported Lines Bank Statement Bank Statements Lines Cancel Cancept Label Change account Chek Chek if invoice and account move line exist Company Company must be the same for its related account and period. Concept Concept Lines Concepts Concepts for Banks Statements Concepts to automate Import Banks Statements in this journal Configuration error! The currency chosen should be shared by the default accounts too. Create Account Move From File Create Temporary Account Move with lines exactly as bank Statement FIrst Iteration. Credit Date Date Range on file Date range read on xls file imported from your attachments Debit Delete Imported From Attachment Delete all lines Imported Description Do you want one move per line or one move per bank statement, 
            True: One Per Line False: One Per bank statement Done Draft Error: La expresion no es lista
        debe quedar algo así:
        ["cadenaA","cadenaB","CadenaC"]
        o es inválida Expense Account Extra Income Account File Must be an XLS file !                 Please verify save as correctly in excel your exported file from bank statement File Name Imported I found quatity of attachments <> 1 !             Please Attach JUST One XLS file to this bank statement. If this bank statement line is confirmed or not, to help useability issues Import Bank Statement / Manager Import Bank Statement / User Import From Attachment Import from First attached document with xls name, and structure documented. Imported lines for banks files In banks you probable wants send account move lines to an extra account
to be able to record account move lines due to bank comisions and bank debit notes, 
in this field you configure this account. In banks you probably want as counter part for extra banking income money 
use an specific account in this field you can canfigure this account In banks you probably want send account move lines to a interim 
account before affect the default debit and credit account who will have the booked 
balance for this kind of operations, in this field you configure this account. Interim Account Invoice Invoice Number must be unique per Company! Invoices Invoices to be reconciled Invoices to be reconciled with this line Journal Journal Items Label Lines to Review Move Temp to conciliate Move line from Bank. N Document Name Name of file imported, to be able to do that add as attach    ment an xls file with the corect format directly imported from Banco Nacional Num Document Office One Move per Line Partner Partner Counterpart Quantity of lines to verify from file. Reconcile Bank Statements Line Set date From File Set date from file, with this button we will read the file and set date and period to be right with the file information State Statement Statement from File line Temporal Move Line Text To be Compared The code of the journal must be unique per company ! The combination of type,company and ssod id must be unique ! The date of your Journal Entry is not in the defined period! You should change the date or remove this constraint from the journal. The journal and period chosen have to belong to the same company. The name of the journal must be unique per company ! The selected account of your Journal Entry forces to provide a secondary currency. You should remove the secondary currency on the account or select a multi-currency view on the journal. This account move is the used to make the conciliation throught the bank statement imported with excel This will be the account to make the account move line as counterpart. This will be the partner to make written on the account move line as counterpart., if you change this value, the account payable or receivable will be automatic selected on Account Move Lines related, specially usefull when you pay several things in the same invoice, Petty cash for example, just select your partner petty cash To Review Total Credit Total Debit Unreconcile Bank Statements Line Validate Warning Wrong credit or debit value in accounting entry ! You can not change account because this bank statement have documents You can not create journal items on an account of type view. You can not create journal items on closed account. You can not make a bank reconcilation for bank moves with dates on different periods You can not make a bank reconcilation in a period different to the period indicated on files, please select correct period it should be %s " % (ini_period and ini_period[0])))
            

        for bsl in st.bs_line_ids:
            
            am_id=am_obj.create(cr, uid, {'ref':'From File %s %s' % (st.fname,st.from_to_file),
                                 'period_id':period_w.id,
                                 'journal_id':journal.id,
                                 'date':actual.date,
                                 'narration':'''Account move created with importation from file %s
                                 ''' % (st.fname),
                                }, context=context)
            
            acc_id=bsl.debit and  st.journal_id.default_credit_account_id.id or st.journal_id.default_debit_account_id.id
            prev=self.set_counterpart(cr, uid, ids, context={'bsl_id':bsl.id})
            payrec_id=prev[0]
            pcp_id=prev[1]
            if bsl.debit:
                payrec_id=pcp_id and partner_obj.browse(cr,uid,pcp_id,context=context).property_account_payable.id or payrec_id
            if bsl.credit:
                payrec_id=pcp_id and partner_obj.browse(cr,uid,pcp_id,context=context).property_account_receivable.id or payrec_id
            if not journal.currency or journal.currency.id == journal.company_id.currency_id.id:
                aml_obj.create(cr,uid,{'move_id':am_id,
                                   'name':bsl.name,
                                   'date':bsl.date,
                                   'credit':bsl.debit,
                                   'debit':bsl.credit,
                                   'stff_id':bsl.id,
                                   'account_id':acc_id,},
                                  context=context)
                aml_obj.create(cr,uid,{'move_id':am_id,
                                   'name':bsl.name,
                                   'date':bsl.date,
                                   'credit':bsl.credit,
                                   'debit':bsl.debit,
                                   'stff_id':bsl.id,
                                   'partner_id':pcp_id,
                                   'account_id':payrec_id,},
                                  context=context)
            elif journal.currency.id != journal.company_id.currency_id.id:
                amount=bsl.debit and bsl.debit or bsl.credit
                curobj=self.pool.get('res.currency')
                amount=curobj.compute(cr, uid, journal.currency.id, journal.company_id.currency_id.id, amount, context=context)
                aml_obj.create(cr,uid,{'move_id':am_id,
                                   'name':bsl.name,
                                   'date':bsl.date,
                                   'credit':bsl.debit and amount or 0.00,
                                   'debit':bsl.credit and amount or 0.00,
                                   'stff_id':bsl.id,
                                   'amount_currency':bsl.debit and bsl.debit or bsl.credit,
                                   'account_id':acc_id,},
                                  context=context)
                aml_obj.create(cr,uid,{'move_id':am_id,
                                   'name':bsl.name,
                                   'date':bsl.date,
                                   'credit':bsl.credit and amount or 0.00,
                                   'debit':bsl.debit and amount or 0.00,
                                   'partner_id':pcp_id,
                                   'stff_id':bsl.id,
                                   'amount_currency':bsl.debit and bsl.debit or bsl.credit,
                                   'account_id':payrec_id,},
                                  context=context)
            bsl.write({'move_id':am_id,'counterpart_id':payrec_id,
                       'partnercounterpart_id':pcp_id and pcp_id or False})

        self.log(cr, uid, st.id, _('Account Move Temporary For this Statement                                     Id Was Created is created %s ') % (st.id))
        am_obj.log(cr, uid, am_id, _('Account Move Temporary is created %s ') % (am_id))
        return True

    def read_file(self, cr, uid, ids, context=None):
        att_obj=self.pool.get('ir.attachment')
        file_xls_ids=att_obj.search(cr,uid,[('res_model','=','account.bank.statement'),('res_id','in',ids)])
        if len(file_xls_ids)<>1:
            raise osv.except_osv(_('Warning'), _('I found quatity of attachments <> 1 !             Please Attach JUST One XLS file to this bank statement.'))
        file_xls_brw=att_obj.browse(cr, uid, file_xls_ids, context=context)
        if len(file_xls_ids)==1:
            checkfilename=file_xls_brw[0].datas_fname and file_xls_brw[0].datas_fname.endswith('.xls')
            if checkfilename:
                fname_='/tmp/%s' % (file_xls_brw[0].datas_fname)
                f=open(fname_,'w')
                f.write(base64.b64decode(file_xls_brw[0].datas))
                f.close()
                doc=xlrd.open_workbook(fname_)
                sheet = doc.sheet_by_index(0)
                context.update({'xls_sheet':sheet})
                if self.file_verify_cr(cr, uid, ids, context=context):
                    if self.write_file(cr, uid, ids, context=context):
                        self.write(cr, uid, ids, {'fname':file_xls_brw[0].datas_fname},context=context)
                        self.set_date_period(cr,uid,ids,context=context)
            else:
                raise osv.except_osv(_('Warning'), _('File Must be an XLS file !                 Please verify save as correctly in excel your exported file from bank statement'))
        file_xls_brw=att_obj.browse(cr,uid,file_xls_ids, context=context)
        return True

account_bank_statement()

class bank_statement_imported_lines(osv.osv):
    "
    OpenERP Model : ClassName
    "
    
    _name = 'bank.statement.imported.lines'
    _description = 'Imported lines for banks files'
    
    
    #def _balance(self, cr, uid,ids,field_name,args,context=None):
        #res = {}
        #
        #for i in ids:
            #debit = 0.0
            #amt_unt = 0.0
            #bsil_brw = self.browse(cr,uid,i,context=context)
            #counterpart_id = bsil_brw.counterpart_id
            #for aml in bsil_brw.aml_ids:
                #if aml.account_id == counterpart_id:
                    #debit += aml.debit or aml.credit
            #for inv in bsil_brw.invoice_ids:
                #if inv.account_id == counterpart_id:
                    #amt_unt += inv.amount_total
            #for amls in bsil_brw.acc_move_line_ids:
                #if amls.account_id == counterpart_id:
                    #amt_unt+=amls[aml.debit and 'credit' or 'debit']
                #
            #res[i]=debit-amt_unt
        #return res
    
    
    _columns = {
        'name':fields.char('Description', size=255, required=True, readonly=False),
        'date': fields.date('Date', required=True),
        'numdocument':fields.char('Num Document', size=64, required=True, readonly=False),
        'debit': fields.float('Debit', digits_compute=dp.get_precision('Account'), required=True),
        'invo_move_line':fields.boolean('Chek',help='Chek if invoice and account move line exist'),
        'move_id':fields.many2one('account.move','Account Move'),
        'credit': fields.float('Credit', digits_compute=dp.get_precision('Account'), required=True),
        'office':fields.char('Office', size=16, required=False, readonly=False),
        'bank_statement_id':fields.many2one('account.bank.statement', 'Bank Statement', required=True),
        'acc_move_line_ids':fields.many2many('account.move.line','account_move_line_rel','aml_ids','aml_id'),
        'company_id':fields.many2one('res.company','Company',required=False),
        'aml_ids':fields.one2many('account.move.line', 'stff_id', 'Account Move Lines'),
        'counterpart_id':fields.many2one('account.account','Account Counterpart', required=False,
            help="This will be the account to make the account move line as counterpart. You can not make a bank reconcilation in a period different to the period indicated on files, please select correct period it should be %s " % (ini_period and ini_period[0])))
            

        for bsl in st.bs_line_ids:
            
            am_id=am_obj.create(cr, uid, {'ref':'From File %s %s' % (st.fname,st.from_to_file),
                                 'period_id':period_w.id,
                                 'journal_id':journal.id,
                                 'date':actual.date,
                                 'narration':'''Account move created with importation from file %s
                                 ''' % (st.fname),
                                }, context=context)
            
            acc_id=bsl.debit and  st.journal_id.default_credit_account_id.id or st.journal_id.default_debit_account_id.id
            prev=self.set_counterpart(cr, uid, ids, context={'bsl_id':bsl.id})
            payrec_id=prev[0]
            pcp_id=prev[1]
            if bsl.debit:
                payrec_id=pcp_id and partner_obj.browse(cr,uid,pcp_id,context=context).property_account_payable.id or payrec_id
            if bsl.credit:
                payrec_id=pcp_id and partner_obj.browse(cr,uid,pcp_id,context=context).property_account_receivable.id or payrec_id
            if not journal.currency or journal.currency.id == journal.company_id.currency_id.id:
                aml_obj.create(cr,uid,{'move_id':am_id,
                                   'name':bsl.name,
                                   'date':bsl.date,
                                   'credit':bsl.debit,
                                   'debit':bsl.credit,
                                   'stff_id':bsl.id,
                                   'account_id':acc_id,},
                                  context=context)
                aml_obj.create(cr,uid,{'move_id':am_id,
                                   'name':bsl.name,
                                   'date':bsl.date,
                                   'credit':bsl.credit,
                                   'debit':bsl.debit,
                                   'stff_id':bsl.id,
                                   'partner_id':pcp_id,
                                   'account_id':payrec_id,},
                                  context=context)
            elif journal.currency.id != journal.company_id.currency_id.id:
                amount=bsl.debit and bsl.debit or bsl.credit
                curobj=self.pool.get('res.currency')
                amount=curobj.compute(cr, uid, journal.currency.id, journal.company_id.currency_id.id, amount, context=context)
                aml_obj.create(cr,uid,{'move_id':am_id,
                                   'name':bsl.name,
                                   'date':bsl.date,
                                   'credit':bsl.debit and amount or 0.00,
                                   'debit':bsl.credit and amount or 0.00,
                                   'stff_id':bsl.id,
                                   'amount_currency':bsl.debit and bsl.debit or bsl.credit,
                                   'account_id':acc_id,},
                                  context=context)
                aml_obj.create(cr,uid,{'move_id':am_id,
                                   'name':bsl.name,
                                   'date':bsl.date,
                                   'credit':bsl.credit and amount or 0.00,
                                   'debit':bsl.debit and amount or 0.00,
                                   'partner_id':pcp_id,
                                   'stff_id':bsl.id,
                                   'amount_currency':bsl.debit and bsl.debit or bsl.credit,
                                   'account_id':payrec_id,},
                                  context=context)
            bsl.write({'move_id':am_id,'counterpart_id':payrec_id,
                       'partnercounterpart_id':pcp_id and pcp_id or False})

        self.log(cr, uid, st.id, _('Account Move Temporary For this Statement                                     Id Was Created is created %s ') % (st.id))
        am_obj.log(cr, uid, am_id, _('Account Move Temporary is created %s ') % (am_id))
        return True

    def read_file(self, cr, uid, ids, context=None):
        att_obj=self.pool.get('ir.attachment')
        file_xls_ids=att_obj.search(cr,uid,[('res_model','=','account.bank.statement'),('res_id','in',ids)])
        if len(file_xls_ids)<>1:
            raise osv.except_osv(_('Warning'), _('I found quatity of attachments <> 1 !             Please Attach JUST One XLS file to this bank statement.'))
        file_xls_brw=att_obj.browse(cr, uid, file_xls_ids, context=context)
        if len(file_xls_ids)==1:
            checkfilename=file_xls_brw[0].datas_fname and file_xls_brw[0].datas_fname.endswith('.xls')
            if checkfilename:
                fname_='/tmp/%s' % (file_xls_brw[0].datas_fname)
                f=open(fname_,'w')
                f.write(base64.b64decode(file_xls_brw[0].datas))
                f.close()
                doc=xlrd.open_workbook(fname_)
                sheet = doc.sheet_by_index(0)
                context.update({'xls_sheet':sheet})
                if self.file_verify_cr(cr, uid, ids, context=context):
                    if self.write_file(cr, uid, ids, context=context):
                        self.write(cr, uid, ids, {'fname':file_xls_brw[0].datas_fname},context=context)
                        self.set_date_period(cr,uid,ids,context=context)
            else:
                raise osv.except_osv(_('Warning'), _('File Must be an XLS file !                 Please verify save as correctly in excel your exported file from bank statement'))
        file_xls_brw=att_obj.browse(cr,uid,file_xls_ids, context=context)
        return True

account_bank_statement()

class bank_statement_imported_lines(osv.osv):
    "
    OpenERP Model : ClassName
    "
    
    _name = 'bank.statement.imported.lines'
    _description = 'Imported lines for banks files'
    
    
    #def _balance(self, cr, uid,ids,field_name,args,context=None):
        #res = {}
        #
        #for i in ids:
            #debit = 0.0
            #amt_unt = 0.0
            #bsil_brw = self.browse(cr,uid,i,context=context)
            #counterpart_id = bsil_brw.counterpart_id
            #for aml in bsil_brw.aml_ids:
                #if aml.account_id == counterpart_id:
                    #debit += aml.debit or aml.credit
            #for inv in bsil_brw.invoice_ids:
                #if inv.account_id == counterpart_id:
                    #amt_unt += inv.amount_total
            #for amls in bsil_brw.acc_move_line_ids:
                #if amls.account_id == counterpart_id:
                    #amt_unt+=amls[aml.debit and 'credit' or 'debit']
                #
            #res[i]=debit-amt_unt
        #return res
    
    
    _columns = {
        'name':fields.char('Description', size=255, required=True, readonly=False),
        'date': fields.date('Date', required=True),
        'numdocument':fields.char('Num Document', size=64, required=True, readonly=False),
        'debit': fields.float('Debit', digits_compute=dp.get_precision('Account'), required=True),
        'move_id':fields.many2one('account.move','Account Move'),
        'credit': fields.float('Credit', digits_compute=dp.get_precision('Account'), required=True),
        'office':fields.char('Office', size=16, required=False, readonly=False),
        'bank_statement_id':fields.many2one('account.bank.statement', 'Bank Statement', required=True),
        'acc_move_line_ids':fields.many2many('account.move.line','account_move_line_rel','aml_ids','aml_id'),
        'company_id':fields.many2one('res.company','Company',required=False),
        'aml_ids':fields.one2many('account.move.line', 'stff_id', 'Account Move Lines'),
        'counterpart_id':fields.many2one('account.account','Account Counterpart', required=False,
            help="This will be the account to make the account move line as counterpart. You can not re-create account move's, modify manually on lines where you need do something or delete lines and start again (remember delete the account move related) account.journal.bs.config unknown Project-Id-Version: OpenERP Server 6.1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2012-09-01 15:42+0000
PO-Revision-Date: 2012-09-01 11:50-0400
Last-Translator: Jose Antonio <jose@vauxoo.com>
Language-Team: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: 
 Cuenta Cuenta contrapartida Asiento Contable Apunte contable Apunte contable Asiento contable temportal para este extracto                                    El id generado es %s  Temporal asiento contable creado %s  Lineas del banco importadas Extracto Bancario Lineas de Extracto Bancario Cancel Cancept Label Cambio de cuenta Chek Verifique si la factura y el apunte contable existe Compañia La compañía debe ser la misma para su cuenta y periodos relacionados Conecpto Lineas conceptuales Conceptos Concepts for Banks Statements Conceptos para automatizar bancos de importación declaraciones en esta revista ¡Error de configuración! La moneda elegida debería ser también la misma en las cuentas por defecto Crear asientos contables desde un archivo Creado temporalmente un asiento contable con las lineas exactas de la primera iteración del extrato bancario. Credit Fecha Rango de fecha en el archivo Intervalo de tiempo en leer xls importada de los archivos adjuntos Debito Eliminar datos Importados desde el archivo Adjunto Eliminar todas las lineas importadas Descripción ¿Quieres una movimiento por la línea o un movimiento por estado de cuenta bancario, 
             True: uno por línea 
 Falso: Una por estado de cuenta bancario Listo Borrador Error: La expresion no es lista
        debe quedar algo así:
        ["cadenaA","cadenaB","CadenaC"]
        o es inválida Cuenta de gasto Cuentas de ingresos extras El archivo debe ser un archivo XLS!   Por favor, verifique guardar correctamente en Excel el archivo exportado de estado de cuenta bancaria Nombre del archivo importado Se ha encontrado mas de un archivo adjunto!             Por favor adjunto solo un archivo XLS para este extracto bancario. If this bank statement line is confirmed or not, to help useability issues Import Bank Statement / Manager Importar Extracto Bancario / User Importar desde archivo adjunto Importar desde un archivo XLS adjunto con formato xls y estructura documentada. Importadas lineas por lineas de bancos En los bancos que probablemente quiere enviar cuenta las líneas se mueven a una cuenta extra 
para ser capaz de grabar cuenta las líneas moverse debido a comisions bancarios y documentos de débito, 
en este campo se configura esta cuenta. En los bancos es probable que desee participar como contador de dinero extra de los ingresos bancarios 
utilizar una cuenta específica en este campo puede canfigure esta cuenta En los bancos es probable que desee enviar cuenta las líneas se mueven a un interino 
cuenta antes de afectar el débito y cuenta de crédito por defecto que tendrá el reservado 
equilibrio para este tipo de operaciones, en este campo se configura esta cuenta. Cuenta Provisional Factura ¡El número de factura debe ser único por empresa! Facturas Facturas a ser reconciliadas Facturas a ser conciliadas con esta linea Diario Apuntes contables Etiqueta Lineas a revisar Movimiento temporal para conciliar. Linea del movimiento desde el banco N Documento Nombre Nombre de archivo importado, para ser capaz de hacer ese complemento como adjunto un archivo xls con el formato correcto importados directamente de Banco Nacional Num Documento Office Un movimiento por linea Partner Partner contrapartida Cantidad de lineas a ser verificadas desde el archivo Reconciliar linea del extracto bancario Establecer fecha desde archivo Establezca la fecha de archivo, con este botón vamos a leer el archivo y elija la fecha y el período para estar bien con la información del archivo Estado Extracto Extracto desde una linea del archivo Linea de movimiento temporal Texto a ser comparado ¡El código del diario debe ser único por compañía! La combinacion de tipo, compañia y ssod id deben ser unicos! ¡La fecha de su asiento no está en el periodo definido! Usted debería cambiar la fecha o borar esta restricción del diario. El diario y periodo seleccionados tienen que pertenecer a la misma compañía ¡El nombre del diaro debe ser único por compañía! La cuenta seleccionada en su asiento fuerza a tener una moneda secundaria. Debería eliminar la moneda secundaria de la cuenta o asignar al diario una vista multi-moneda Este movimiento cuenta es la utilizada para realizar la conciliación a través de la importación estado de cuenta bancario con Excel Esta sera la cuenta para hacer el apunte contable como contrapartida. Esta será el partner el cual sera escrito en la línea de movimiento cuenta como contraparte., Si cambia este valor, la cuenta por pagar o por cobrar será automático seleccionado sobre líneas de Move cuenta relacionada, especialmente útil cuando usted paga varias cosas en la misma factura, caja chica por ejemplo, sólo tienes que seleccionar tu dinero socio pequeño Para revisar Crédito Total Debito Total Unreconcile Bank Statements Line Validar Cuidado ¡Valor haber o debe erróneo en el asiento contable! No puede cambiar la cuenta debido a que este extracto bancario tiene documentos asociados No puede crear asientos en una cuenta de tipo vista No puede crear asientos en cuentas cerradas No se puede hacer una reconciliación bancaria para movimientos bancarios con fechas en diferentes períodos You can not make a bank reconcilation in a period different to the period indicated on files, please select correct period it should be %s " % (ini_period and ini_period[0])))
            

        for bsl in st.bs_line_ids:
            
            am_id=am_obj.create(cr, uid, {'ref':'From File %s %s' % (st.fname,st.from_to_file),
                                 'period_id':period_w.id,
                                 'journal_id':journal.id,
                                 'date':actual.date,
                                 'narration':'''Account move created with importation from file %s
                                 ''' % (st.fname),
                                }, context=context)
            
            acc_id=bsl.debit and  st.journal_id.default_credit_account_id.id or st.journal_id.default_debit_account_id.id
            prev=self.set_counterpart(cr, uid, ids, context={'bsl_id':bsl.id})
            payrec_id=prev[0]
            pcp_id=prev[1]
            if bsl.debit:
                payrec_id=pcp_id and partner_obj.browse(cr,uid,pcp_id,context=context).property_account_payable.id or payrec_id
            if bsl.credit:
                payrec_id=pcp_id and partner_obj.browse(cr,uid,pcp_id,context=context).property_account_receivable.id or payrec_id
            if not journal.currency or journal.currency.id == journal.company_id.currency_id.id:
                aml_obj.create(cr,uid,{'move_id':am_id,
                                   'name':bsl.name,
                                   'date':bsl.date,
                                   'credit':bsl.debit,
                                   'debit':bsl.credit,
                                   'stff_id':bsl.id,
                                   'account_id':acc_id,},
                                  context=context)
                aml_obj.create(cr,uid,{'move_id':am_id,
                                   'name':bsl.name,
                                   'date':bsl.date,
                                   'credit':bsl.credit,
                                   'debit':bsl.debit,
                                   'stff_id':bsl.id,
                                   'partner_id':pcp_id,
                                   'account_id':payrec_id,},
                                  context=context)
            elif journal.currency.id != journal.company_id.currency_id.id:
                amount=bsl.debit and bsl.debit or bsl.credit
                curobj=self.pool.get('res.currency')
                amount=curobj.compute(cr, uid, journal.currency.id, journal.company_id.currency_id.id, amount, context=context)
                aml_obj.create(cr,uid,{'move_id':am_id,
                                   'name':bsl.name,
                                   'date':bsl.date,
                                   'credit':bsl.debit and amount or 0.00,
                                   'debit':bsl.credit and amount or 0.00,
                                   'stff_id':bsl.id,
                                   'amount_currency':bsl.debit and bsl.debit or bsl.credit,
                                   'account_id':acc_id,},
                                  context=context)
                aml_obj.create(cr,uid,{'move_id':am_id,
                                   'name':bsl.name,
                                   'date':bsl.date,
                                   'credit':bsl.credit and amount or 0.00,
                                   'debit':bsl.debit and amount or 0.00,
                                   'partner_id':pcp_id,
                                   'stff_id':bsl.id,
                                   'amount_currency':bsl.debit and bsl.debit or bsl.credit,
                                   'account_id':payrec_id,},
                                  context=context)
            bsl.write({'move_id':am_id,'counterpart_id':payrec_id,
                       'partnercounterpart_id':pcp_id and pcp_id or False})

        self.log(cr, uid, st.id, _('Account Move Temporary For this Statement                                     Id Was Created is created %s ') % (st.id))
        am_obj.log(cr, uid, am_id, _('Account Move Temporary is created %s ') % (am_id))
        return True

    def read_file(self, cr, uid, ids, context=None):
        att_obj=self.pool.get('ir.attachment')
        file_xls_ids=att_obj.search(cr,uid,[('res_model','=','account.bank.statement'),('res_id','in',ids)])
        if len(file_xls_ids)<>1:
            raise osv.except_osv(_('Warning'), _('I found quatity of attachments <> 1 !             Please Attach JUST One XLS file to this bank statement.'))
        file_xls_brw=att_obj.browse(cr, uid, file_xls_ids, context=context)
        if len(file_xls_ids)==1:
            checkfilename=file_xls_brw[0].datas_fname and file_xls_brw[0].datas_fname.endswith('.xls')
            if checkfilename:
                fname_='/tmp/%s' % (file_xls_brw[0].datas_fname)
                f=open(fname_,'w')
                f.write(base64.b64decode(file_xls_brw[0].datas))
                f.close()
                doc=xlrd.open_workbook(fname_)
                sheet = doc.sheet_by_index(0)
                context.update({'xls_sheet':sheet})
                if self.file_verify_cr(cr, uid, ids, context=context):
                    if self.write_file(cr, uid, ids, context=context):
                        self.write(cr, uid, ids, {'fname':file_xls_brw[0].datas_fname},context=context)
                        self.set_date_period(cr,uid,ids,context=context)
            else:
                raise osv.except_osv(_('Warning'), _('File Must be an XLS file !                 Please verify save as correctly in excel your exported file from bank statement'))
        file_xls_brw=att_obj.browse(cr,uid,file_xls_ids, context=context)
        return True

account_bank_statement()

class bank_statement_imported_lines(osv.osv):
    "
    OpenERP Model : ClassName
    "
    
    _name = 'bank.statement.imported.lines'
    _description = 'Imported lines for banks files'
    
    
    #def _balance(self, cr, uid,ids,field_name,args,context=None):
        #res = {}
        #
        #for i in ids:
            #debit = 0.0
            #amt_unt = 0.0
            #bsil_brw = self.browse(cr,uid,i,context=context)
            #counterpart_id = bsil_brw.counterpart_id
            #for aml in bsil_brw.aml_ids:
                #if aml.account_id == counterpart_id:
                    #debit += aml.debit or aml.credit
            #for inv in bsil_brw.invoice_ids:
                #if inv.account_id == counterpart_id:
                    #amt_unt += inv.amount_total
            #for amls in bsil_brw.acc_move_line_ids:
                #if amls.account_id == counterpart_id:
                    #amt_unt+=amls[aml.debit and 'credit' or 'debit']
                #
            #res[i]=debit-amt_unt
        #return res
    
    
    _columns = {
        'name':fields.char('Description', size=255, required=True, readonly=False),
        'date': fields.date('Date', required=True),
        'numdocument':fields.char('Num Document', size=64, required=True, readonly=False),
        'debit': fields.float('Debit', digits_compute=dp.get_precision('Account'), required=True),
        'invo_move_line':fields.boolean('Chek',help='Chek if invoice and account move line exist'),
        'move_id':fields.many2one('account.move','Account Move'),
        'credit': fields.float('Credit', digits_compute=dp.get_precision('Account'), required=True),
        'office':fields.char('Office', size=16, required=False, readonly=False),
        'bank_statement_id':fields.many2one('account.bank.statement', 'Bank Statement', required=True),
        'acc_move_line_ids':fields.many2many('account.move.line','account_move_line_rel','aml_ids','aml_id'),
        'company_id':fields.many2one('res.company','Company',required=False),
        'aml_ids':fields.one2many('account.move.line', 'stff_id', 'Account Move Lines'),
        'counterpart_id':fields.many2one('account.account','Account Counterpart', required=False,
            help="This will be the account to make the account move line as counterpart. You can not make a bank reconcilation in a period different to the period indicated on files, please select correct period it should be %s " % (ini_period and ini_period[0])))
            

        for bsl in st.bs_line_ids:
            
            am_id=am_obj.create(cr, uid, {'ref':'From File %s %s' % (st.fname,st.from_to_file),
                                 'period_id':period_w.id,
                                 'journal_id':journal.id,
                                 'date':actual.date,
                                 'narration':'''Account move created with importation from file %s
                                 ''' % (st.fname),
                                }, context=context)
            
            acc_id=bsl.debit and  st.journal_id.default_credit_account_id.id or st.journal_id.default_debit_account_id.id
            prev=self.set_counterpart(cr, uid, ids, context={'bsl_id':bsl.id})
            payrec_id=prev[0]
            pcp_id=prev[1]
            if bsl.debit:
                payrec_id=pcp_id and partner_obj.browse(cr,uid,pcp_id,context=context).property_account_payable.id or payrec_id
            if bsl.credit:
                payrec_id=pcp_id and partner_obj.browse(cr,uid,pcp_id,context=context).property_account_receivable.id or payrec_id
            if not journal.currency or journal.currency.id == journal.company_id.currency_id.id:
                aml_obj.create(cr,uid,{'move_id':am_id,
                                   'name':bsl.name,
                                   'date':bsl.date,
                                   'credit':bsl.debit,
                                   'debit':bsl.credit,
                                   'stff_id':bsl.id,
                                   'account_id':acc_id,},
                                  context=context)
                aml_obj.create(cr,uid,{'move_id':am_id,
                                   'name':bsl.name,
                                   'date':bsl.date,
                                   'credit':bsl.credit,
                                   'debit':bsl.debit,
                                   'stff_id':bsl.id,
                                   'partner_id':pcp_id,
                                   'account_id':payrec_id,},
                                  context=context)
            elif journal.currency.id != journal.company_id.currency_id.id:
                amount=bsl.debit and bsl.debit or bsl.credit
                curobj=self.pool.get('res.currency')
                amount=curobj.compute(cr, uid, journal.currency.id, journal.company_id.currency_id.id, amount, context=context)
                aml_obj.create(cr,uid,{'move_id':am_id,
                                   'name':bsl.name,
                                   'date':bsl.date,
                                   'credit':bsl.debit and amount or 0.00,
                                   'debit':bsl.credit and amount or 0.00,
                                   'stff_id':bsl.id,
                                   'amount_currency':bsl.debit and bsl.debit or bsl.credit,
                                   'account_id':acc_id,},
                                  context=context)
                aml_obj.create(cr,uid,{'move_id':am_id,
                                   'name':bsl.name,
                                   'date':bsl.date,
                                   'credit':bsl.credit and amount or 0.00,
                                   'debit':bsl.debit and amount or 0.00,
                                   'partner_id':pcp_id,
                                   'stff_id':bsl.id,
                                   'amount_currency':bsl.debit and bsl.debit or bsl.credit,
                                   'account_id':payrec_id,},
                                  context=context)
            bsl.write({'move_id':am_id,'counterpart_id':payrec_id,
                       'partnercounterpart_id':pcp_id and pcp_id or False})

        self.log(cr, uid, st.id, _('Account Move Temporary For this Statement                                     Id Was Created is created %s ') % (st.id))
        am_obj.log(cr, uid, am_id, _('Account Move Temporary is created %s ') % (am_id))
        return True

    def read_file(self, cr, uid, ids, context=None):
        att_obj=self.pool.get('ir.attachment')
        file_xls_ids=att_obj.search(cr,uid,[('res_model','=','account.bank.statement'),('res_id','in',ids)])
        if len(file_xls_ids)<>1:
            raise osv.except_osv(_('Warning'), _('I found quatity of attachments <> 1 !             Please Attach JUST One XLS file to this bank statement.'))
        file_xls_brw=att_obj.browse(cr, uid, file_xls_ids, context=context)
        if len(file_xls_ids)==1:
            checkfilename=file_xls_brw[0].datas_fname and file_xls_brw[0].datas_fname.endswith('.xls')
            if checkfilename:
                fname_='/tmp/%s' % (file_xls_brw[0].datas_fname)
                f=open(fname_,'w')
                f.write(base64.b64decode(file_xls_brw[0].datas))
                f.close()
                doc=xlrd.open_workbook(fname_)
                sheet = doc.sheet_by_index(0)
                context.update({'xls_sheet':sheet})
                if self.file_verify_cr(cr, uid, ids, context=context):
                    if self.write_file(cr, uid, ids, context=context):
                        self.write(cr, uid, ids, {'fname':file_xls_brw[0].datas_fname},context=context)
                        self.set_date_period(cr,uid,ids,context=context)
            else:
                raise osv.except_osv(_('Warning'), _('File Must be an XLS file !                 Please verify save as correctly in excel your exported file from bank statement'))
        file_xls_brw=att_obj.browse(cr,uid,file_xls_ids, context=context)
        return True

account_bank_statement()

class bank_statement_imported_lines(osv.osv):
    "
    OpenERP Model : ClassName
    "
    
    _name = 'bank.statement.imported.lines'
    _description = 'Imported lines for banks files'
    
    
    #def _balance(self, cr, uid,ids,field_name,args,context=None):
        #res = {}
        #
        #for i in ids:
            #debit = 0.0
            #amt_unt = 0.0
            #bsil_brw = self.browse(cr,uid,i,context=context)
            #counterpart_id = bsil_brw.counterpart_id
            #for aml in bsil_brw.aml_ids:
                #if aml.account_id == counterpart_id:
                    #debit += aml.debit or aml.credit
            #for inv in bsil_brw.invoice_ids:
                #if inv.account_id == counterpart_id:
                    #amt_unt += inv.amount_total
            #for amls in bsil_brw.acc_move_line_ids:
                #if amls.account_id == counterpart_id:
                    #amt_unt+=amls[aml.debit and 'credit' or 'debit']
                #
            #res[i]=debit-amt_unt
        #return res
    
    
    _columns = {
        'name':fields.char('Description', size=255, required=True, readonly=False),
        'date': fields.date('Date', required=True),
        'numdocument':fields.char('Num Document', size=64, required=True, readonly=False),
        'debit': fields.float('Debit', digits_compute=dp.get_precision('Account'), required=True),
        'move_id':fields.many2one('account.move','Account Move'),
        'credit': fields.float('Credit', digits_compute=dp.get_precision('Account'), required=True),
        'office':fields.char('Office', size=16, required=False, readonly=False),
        'bank_statement_id':fields.many2one('account.bank.statement', 'Bank Statement', required=True),
        'acc_move_line_ids':fields.many2many('account.move.line','account_move_line_rel','aml_ids','aml_id'),
        'company_id':fields.many2one('res.company','Company',required=False),
        'aml_ids':fields.one2many('account.move.line', 'stff_id', 'Account Move Lines'),
        'counterpart_id':fields.many2one('account.account','Account Counterpart', required=False,
            help="This will be the account to make the account move line as counterpart. No se puede volver a crear movimiento de la cuenta, modificar manualmente en líneas en las que es necesario hacer algo o borrar líneas y empezar de nuevo (recuerde eliminar el movimiento cuenta relacionados) account.journal.bs.config unknown 