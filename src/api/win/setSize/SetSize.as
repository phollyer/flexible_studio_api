package api.win.setSize
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Event(name="missingHeight" , type="api.events.SWFStudioEvent")]
	[Event(name="missingWidth" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetSize extends Win
	{		
		// Required
		public var height:Number = -1;
		public var width:Number = -1;
		
		public function SetSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function setSize( winHeight:Number = -1 , winWidth:Number = -1 ):void
		{			
			height = compareNumbers( winHeight , height );
			width = compareNumbers( winWidth , width );
			
			switch( height > -1 )
			{
				case false:
					missingHeight();
					break;
				default:
					switch( width > -1 )
					{
						case false:
							missingWidth();
							break;
						default:
							ssCore.Win.setSize( {width:width , height:height}
											   ,{callback:actionComplete, errorSTR:"setSizeError", code:"6027"} );	
					}
			}
		}
		private function setSizeComplete( r:Object , c:Object , e:Object ):void
		{			
			switch( r.success )
			{
				case true:
					var event : SetSizeEvent = new SetSizeEvent( SetSizeEvent.RESULT );
					dispatchEvent( event );
					break;
				case false:
					e.id = "6027";
					dispatchError( WinError.SET_SIZE_ERROR , e );
			}
		}

	}
}