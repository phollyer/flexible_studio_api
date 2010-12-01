package api.vos.email
{
	[Bindable]
	public class SendVO extends Object
	{
		// Body Format
		public static const HTML:String = "HTML";
		public static const SIMPLE:String = "Simple";
		public static const TEXT:String = "Text";
		
		// Importance
		public static const HIGH:String = "High";
		public static const NORMAL:String = "Normal";
		
		// Required
		public var toAddress:String = null;
		
		// Optional
		public var attachments:Array = null;
		public var body:String = null;
		public var bodyFormat:String = TEXT;
		public var charset:String = "iso-8859-1";
		public var fromAddress:String = null;
		public var headers:Array = null;
		public var importance:String = NORMAL;
		public var readReceiptTo:String = null;
		public var server:String = null;
		public var subject:String = null;
		public var timeOut:Number = 60;
		
		public function SendVO()
		{
			super();
		}
		public function createEmail():Object
		{
			var __o : Object = new Object();
			__o.toAddress = toAddress;
			__o.bodyFormat = bodyFormat;
			__o.charset = charset;
			__o.importance = importance;
			__o.timeOut = timeOut;
			
			switch( attachments.length > 0 )
			{
				case true:
					__o.attachments = attachments.join( "\n" );
			}
			switch( body != null )
			{
				case true:
					__o.body = body;
			}
			switch( fromAddress != null )
			{
				case true:
					__o.fromAddress = fromAddress;
			}
			switch( headers.length > 0 )
			{
				case true:
					__o.headers = headers.join( "\n" );
			}
			switch( readReceiptTo != null )
			{
				case true:
					__o.readReceiptTo = readReceiptTo;
			}
			switch( server != null )
			{
				case true:
					__o.server = server;
			}
			switch( subject != null )
			{
				case true:
					__o.subject = subject;
			}
			return __o;
		}
	}
}