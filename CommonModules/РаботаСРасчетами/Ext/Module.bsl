﻿Процедура ПерерасчитатьНачисления (ТребуемыйВидРасчета) Экспорт
	
	Запрос = Новый Запрос(
	  "ВЫБРАТЬ
	 |	НачисенияПерерасчет.ОбъектПерерасчета КАК ОбъектПерерасчета,
	 |	НачисенияПерерасчет.Сотрудник КАК Сотрудник
	 |ИЗ
	 |	РегистрРасчета.Начисления.Перерасчет КАК НачисенияПерерасчет
	 |	Где
	 |		НачисенияПерерасчет.ВидРасчета = &ТребуемыйВидРасчета
	 |
	 |Итоги ПО НачисенияПерерасчет.ОбъектПерерасчета");
	
	Запрос.УстановитьПараметр("ТребуемыйВидРасчета",ТребуемыйВидРасчета);
	
	СписокСотрудников = Новый СписокЗначений;
	
	ВыборкаПоРегистратору = Запрос.Выполнить().Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
	
	Пока ВыборкаПоРегистратору.Следующий() Цикл
		Регистратор = ВыборкаПоРегистратору.ОбъектПерерасчета;
		
		ВыборкаПоСотрудникам = ВыборкаПоРегистратору.Выбрать();
		СписокСотрудников.Очистить();
		Пока ВыборкаПоСотрудникам.Следующий() цикл
			СписокСотрудников.Добавить(ВыборкаПоСотрудникам.Сотрудник);
		КонецЦикла;
		
		НаборЗаписей = РегистрыРасчета.Начисления.СоздатьНаборЗаписей();
		НаборЗаписей.Отбор.Регистратор.Значение = Регистратор;
		НаборЗаписей.Прочитать();
		РассчитатьНачисления(НаборЗаписей,ТребуемыйВидРасчета,СписокСотрудников);
		НаборЗаписей.Записать(,Истина);
		
		НаборЗаписейПерерасчета = РегистрыРасчета.Начисления.Перерасчеты.Перерасчет.СоздатьНаборЗаписей();
		НаборЗаписейПерерасчета.Отбор.ОбъектПерерасчета.Значение = Регистратор;
		НаборЗаписейПерерасчета.Записать();
		
	КонецЦикла;
КонецПроцедуры