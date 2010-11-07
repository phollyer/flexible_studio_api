package api.clipboard.setData
{
	import flash.events.IEventDispatcher;
	
	import api.clipboard.Clipboard;

	[Bindable]
	public class SetData extends Clipboard
	{
		// Optional
		public var text:String = null;
		public var rtf:String = null;
		
		public function SetData(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setData():void
		{
			switch( text )
			{
				case null:
					switch( rtf )
					{
						case null:
							missingData();
							break;
						default:
							ssCore.Clipboard.setData( {rtf:rtf} , {callback:actionComplete, errorSTR:"setDataError", code:"12003"} );
					}
					break;
				default:
					ssCore.Clipboard.setData( {text:text} , {callback:actionComplete, errorSTR:"setDataError", code:"12003"} );
			}
		}
	}
}