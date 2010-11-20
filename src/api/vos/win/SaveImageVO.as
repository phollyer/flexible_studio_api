package api.vos.win
{
	public class SaveImageVO extends Object
	{
		public static const JPEG:String = "jpeg";
		public static const BITMAP:String = "bitmap";
		// Required
		public var path:String = null;
		
		// Optional
		public var clientOnly:Boolean = false;
		public var format:String = JPEG;
		public var height:Number = -1;
		public var left:Number = 0;
		public var quality:Number = 90;	
		public var top:Number = 0;
		public var width:Number = -1;	
		
		public function SaveImageVO()
		{
			super();
		}
		public function createObject():Object
		{
			var __o:Object = new Object();
			__o.path = path;
			__o.clientOnly = clientOnly;
			__o.format = format;
			__o.left = left;
			__o.quality = quality;
			__o.top = top;
			
			switch( height > -1 )
			{
				case true:
					__o.height = height;
			}
			switch( width > -1 )
			{
				case true:
					__o.width = width;
			}
			
			return __o
		}
	}
}