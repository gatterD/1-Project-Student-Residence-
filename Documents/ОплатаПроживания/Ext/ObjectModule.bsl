﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр УчетОплатыПроживания 
	Движения.УчетОплатыПроживания.Записывать = Истина;
	Для Каждого ТекСтрокаТЧ_ОплатаОбучения Из ТЧ_ОплатаОбучения Цикл
		Движение = Движения.УчетОплатыПроживания.Добавить();
		Движение.Период = Дата;
		Движение.Студент = ТекСтрокаТЧ_ОплатаОбучения.Студент;
		Движение.НаборХарактеристик = ТекСтрокаТЧ_ОплатаОбучения.НаборХарактеристик;
		Движение.СуммаОплаты = ТекСтрокаТЧ_ОплатаОбучения.ОплатаПроживания;
	КонецЦикла;

	// регистр Управленческий 
	Движения.Управленческий.Записывать = Истина;
	Для Каждого ТекСтрокаТЧ_ОплатаОбучения Из ТЧ_ОплатаОбучения Цикл
		Движение = Движения.Управленческий.Добавить();
		Движение.СчетДт = ПланыСчетов.Основной.РасчетыСПокупателями;
		Движение.СчетКт = ПланыСчетов.Основной.Капитал;
		Движение.Период = Дата;
		Движение.Сумма = ТекСтрокаТЧ_ОплатаОбучения.ОплатаПроживания;
		Движение.СубконтоДт[ПланыВидовХарактеристик.ВидыСубконто.Студент] = ТекСтрокаТЧ_ОплатаОбучения.Студент;
	КонецЦикла;

	// регистр Управленческий 
	Движения.Управленческий.Записывать = Истина;
	Движение = Движения.Управленческий.Добавить();
	Движение.СчетДт = ПланыСчетов.Основной.Капитал;
	Движение.СчетКт = ПланыСчетов.Основной.НДС;
	Движение.Период = Дата;
	Движение.Сумма = СуммаДокумента*0.20;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры
