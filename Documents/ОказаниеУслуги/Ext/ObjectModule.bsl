﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
    Движения.Инвентарь.Записывать = Истина;   
	ОстаткиТов = РегистрыНакопления.Инвентарь;  
	// регистр ОстаткиНоменклатуры Приход
	Движения.Инвентарь.Записывать = Истина;
	Для Каждого ТекСтрокаТЧ_ПереченьНоменклатура Из ТЧ_ПереченьНоменклатура Цикл 
	// Создаем вспомогательные переменные 
		ТекТовар = ТекСтрокаТЧ_ПереченьНоменклатура.Материал;
	// Настраиваем отбор
		ОтборТов = Новый Структура();
		ОтборТов.Вставить("Номенклатура",ТекТовар);
		//  Формируем таблицу остатков и записываем остаточное количество товара на складе
	    ТаблицаОстатков = ОстаткиТов.Остатки(МоментВремени(),ОтборТов,"Номенклатура","Количество");
		Остаток =  ТаблицаОстатков.Итог("Количество");
	Если Остаток >= ТекСтрокаТЧ_ПереченьНоменклатура.Количество Тогда
		Движение = Движения.Инвентарь.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата; 
		Движение.НаборСвойств = ТекСтрокаТЧ_ПереченьНоменклатура.НаборСвойств;
		Движение.Номенклатура = ТекСтрокаТЧ_ПереченьНоменклатура.Материал;
		Движение.Количество = ТекСтрокаТЧ_ПереченьНоменклатура.Количество;
		Движение.Сумма = СуммаДокумента;
	Иначе
		Сообщить("Недостаточно товара: " + ТекТовар + "! Документ не проводится");
		Отказ = Истина;
		Возврат;
	КонецЕсли;
КонецЦикла;

	Усл = ТЧ_Услуги;
	  Если Усл.Количество() = 0 Тогда 
  		Сообщить("Вы не заполнили таблицу: Услуги!"); 
  		Отказ = Истина; 
	  КонецЕсли;
	// регистр Управленческий 
	Движения.Управленческий.Записывать = Истина;
	Движение = Движения.Управленческий.Добавить();
	Движение.СчетДт = ПланыСчетов.Основной.РасчетыСПоставщиками;
	Движение.СчетКт = ПланыСчетов.Основной.Капитал;
	Движение.Период = Дата;
	Движение.Сумма = СуммаДокумента;
	Движение.СубконтоДт[ПланыВидовХарактеристик.ВидыСубконто.Общежитие] = Клиент;

	// регистр Управленческий 
	Движения.Управленческий.Записывать = Истина;
	Движение = Движения.Управленческий.Добавить();
	Движение.СчетДт = ПланыСчетов.Основной.Капитал;
	Движение.СчетКт = ПланыСчетов.Основной.НДС;
	Движение.Период = Дата;
	Движение.Сумма = СуммаДокумента*0.2;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры
