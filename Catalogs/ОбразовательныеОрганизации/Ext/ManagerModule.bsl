﻿
Процедура Печать(ТабДок, Ссылка) Экспорт
	//{{_КОНСТРУКТОР_ПЕЧАТИ(Печать)
	Макет = Справочники.ОбразовательныеОрганизации.ПолучитьМакет("Печать");
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	ОбразовательныеОрганизации.АдресМестонахождения,
	|	ОбразовательныеОрганизации.АдресЭлектроннойПочты,
	|	ОбразовательныеОрганизации.ИНН,
	|	ОбразовательныеОрганизации.Код,
	|	ОбразовательныеОрганизации.КонтактныйТелефон,
	|	ОбразовательныеОрганизации.Наименование,
	|	ОбразовательныеОрганизации.Руководитель
	|ИЗ
	|	Справочник.ОбразовательныеОрганизации КАК ОбразовательныеОрганизации
	|ГДЕ
	|	ОбразовательныеОрганизации.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();

	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	Шапка = Макет.ПолучитьОбласть("Шапка");
	ТабДок.Очистить();

	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;

		ТабДок.Вывести(ОбластьЗаголовок);

		Шапка.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Шапка, Выборка.Уровень());

		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	//}}
КонецПроцедуры
