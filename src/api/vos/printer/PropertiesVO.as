package api.vos.printer
{
	[Bindable]
	public class PropertiesVO extends Object
	{
		public static const LANDSCAPE:String = "landscape";
		public static const PORTRAIT:String = "portrait";
		
		public var fontName:String = null;
		public var fontSize:Number = 0;
		public var paperOrientation:String = null;
		public var copies:Number = 0;
		public var topMargin:Number = -1;
		public var leftMargin:Number = -1;
		public var rightMargin:Number = -1;
		public var bottomMargin:Number = -1;
		public var selectedPrinter:String = null;
		
		public function PropertiesVO()
		{
			super();
		}
		public function createObject():Object
		{
			var __o:Object = new Object();
			
			switch( fontName != null )
			{
				case true:
					__o.fontName = fontName;
			}
			switch( fontSize > 0 )
			{
				case true:
					__o.fontSize = fontSize;
			}
			switch( paperOrientation )
			{
				case LANDSCAPE:
				case PORTRAIT:
					__o.paperOrientation = paperOrientation;
			}
			switch( copies > 0 )
			{
				case true:
					__o.copies = copies;
			}
			switch( topMargin > -1 )
			{
				case true:
					__o.topMargin = topMargin;
			}
			switch( bottomMargin > -1 )
			{
				case true:
					__o.bottomMargin = bottomMargin;
			}
			switch( leftMargin > -1 )
			{
				case true:
					__o.leftMargin = leftMargin;
			}
			switch( rightMargin > -1 )
			{
				case true:
					__o.rightMargin = rightMargin;
			}
			switch( selectedPrinter != null )
			{
				case true:
					__o.selectedPrinter = selectedPrinter;
			}
			
			return __o;
		}
	}
}