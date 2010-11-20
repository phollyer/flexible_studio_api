package swfStudio.vos.tooltip
{
	public class ShowVO extends Object
	{
		// Required
		public var text:String = null;
		
		// Optional
		public var bevelColor:String = "#404040";
		public var delay:Number = 500;
		public var edge:Number = 2;
		public var edgeColor:String = "#404040";
		public var timeout:Number = 5000;
		
		public var fontName:String = null;
		public var fontSize:Number = -1;
		public var maxHeight:Number = -1;
		public var maxWidth:Number = -1;
		public var textColor:String = null;
		public var tipColor:String = null;
		
		public function ShowVO()
		{
			super();
		}
		public function createObject():Object
		{
			var __o:Object = new Object();
			__o.bevelColor = bevelColor;
			__o.delay = delay;
			__o.edge = edge;
			__o.edgeColor = edgeColor;
			__o.timeout = timeout;
			
			switch( fontName != null )
			{
				case true:
					__o.fontName = fontName;
			}
			switch( fontSize > -1 )
			{
				case true:
					__o.fontSize = fontSize;
			}
			switch( maxHeight > -1 )
			{
				case true:
					__o.maxHeight = maxHeight;
			}
			switch( maxWidth > - 1 )
			{
				case true:
					__o.maxWidth = maxWidth;
			}
			switch( textColor != null )
			{
				case true:
					__o.textColor = textColor;
			}
			switch( tipColor != null )
			{
				case true:
					__o.tipColor = tipColor;
			}
			
			return __o;
			
		}
	}
}