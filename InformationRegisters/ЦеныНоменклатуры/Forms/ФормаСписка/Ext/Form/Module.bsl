﻿
&НаКлиенте
Процедура ОтборНоменклатураЗначениеПриИзменении(Элемент)
	УстановитьОтборПоНоменклатуре();
КонецПроцедуры

&НаКлиенте
Процедура ОтборНоменклатураФлагПриИзменении(Элемент)
	УстановитьОтборПоНоменклатуре();
КонецПроцедуры
&НаКлиенте
 Процедура УстановитьОтборПоНоменклатуре() 
	 Список.Отбор.Элементы.Очистить();
	 
	 ЭлементОтбораНоменклатура = Список.Отбор.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных")); 
	 ЭлементОтбораНоменклатура.ЛевоеЗначение = Новый ПолеКомпоновкиДанных("Номенклатура");
	 ЭлементОтбораНоменклатура.ВидСравнения = ВидСравненияКомпоновкиДанных.Равно;
	 ЭлементОтбораНоменклатура.ПравоеЗначение = ЭтаФорма.ОтборНоменклатураЗначение;
	 
	 Если ЭтаФорма.ОтборНоменклатураФлаг Тогда
		 ЭлементОтбораНоменклатура.Использование = Истина;
	 Иначе 
		 ЭлементОтбораНоменклатура.Использование = Ложь;
	КонецЕсли;
КонецПроцедуры
