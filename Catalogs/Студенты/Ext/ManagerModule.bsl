﻿
Процедура Печать(ТабДок, Ссылка) Экспорт
	//{{_КОНСТРУКТОР_ПЕЧАТИ(Печать)
	Макет = Справочники.Студенты.ПолучитьМакет("Печать");
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	Студенты.ДатаРождения,
	|	Студенты.Код,
	|	Студенты.КурсОбучения,
	|	Студенты.Наименование,
	|	Студенты.Пол,
	|	Студенты.ТЧ_Обучение.(
	|		НомерСтроки,
	|		ОбразовательнаяОрганизация,
	|		КоммерческийТипОбучения,
	|		ДатаНачалаОбучения,
	|		ДатаОкончанияОбучения
	|	)
	|ИЗ
	|	Справочник.Студенты КАК Студенты
	|ГДЕ
	|	Студенты.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();

	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	Шапка = Макет.ПолучитьОбласть("Шапка");
	ОбластьТЧ_ОбучениеШапка = Макет.ПолучитьОбласть("ТЧ_ОбучениеШапка");
	ОбластьТЧ_Обучение = Макет.ПолучитьОбласть("ТЧ_Обучение");
	ТабДок.Очистить();

	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;

		ТабДок.Вывести(ОбластьЗаголовок);

		Шапка.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Шапка, Выборка.Уровень());

		ТабДок.Вывести(ОбластьТЧ_ОбучениеШапка);
		ВыборкаТЧ_Обучение = Выборка.ТЧ_Обучение.Выбрать();
		Пока ВыборкаТЧ_Обучение.Следующий() Цикл
			ОбластьТЧ_Обучение.Параметры.Заполнить(ВыборкаТЧ_Обучение);
			ТабДок.Вывести(ОбластьТЧ_Обучение, ВыборкаТЧ_Обучение.Уровень());
		КонецЦикла;

		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	//}}
КонецПроцедуры
