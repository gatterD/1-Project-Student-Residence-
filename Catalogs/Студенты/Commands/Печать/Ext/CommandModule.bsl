﻿
&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	//{{_КОНСТРУКТОР_ПЕЧАТИ(Печать)
	ТабДок = Новый ТабличныйДокумент;
	Печать(ТабДок, ПараметрКоманды);

	ТабДок.ОтображатьСетку = Ложь;
	ТабДок.Защита = Истина;
	ТабДок.ТолькоПросмотр = Истина;
	ТабДок.ОтображатьЗаголовки = Ложь;
	ТабДок.Показать();
	//}}
КонецПроцедуры

&НаСервере
Процедура Печать(ТабДок, ПараметрКоманды)
	Справочники.Студенты.Печать(ТабДок, ПараметрКоманды);
КонецПроцедуры
