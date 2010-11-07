package api.win.setClientSize
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Event(name="missingHeight" , type="api.events.SWFStudioEvent")]
	[Event(name="missingWidth" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetClientSize extends Win
	{		
		// Required
		public var height:Number = -1;
		public var width:Number = -1;
		
		public function SetClientSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function setClientSize( clientHeight:Number = -1 , clientWidth:Number = -1 ):void
		{			
			height = compareNumbers( clientHeight , height );
			width = compareNumbers( clientWidth , clientHeight );
			
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
							ssCore.Win.setClientSize( {width:width , height:height}
											   		 ,{callback:actionComplete, errorSTR:"setClientSizeError", code:"6021"} );	
					}
			}
		}
		private function setClientSizeComplete( r:Object , c:Object , e:Object ):void
		{			
			switch( r.success )
			{
				case true:
					var event : SetClientSizeEvent = new SetClientSizeEvent( SetClientSizeEvent.RESULT );
					dispatchEvent( event );
					break;
				case false:
					e.id = "6021";
					dispatchError( WinError.SET_CLIENT_SIZE_ERROR , e );
			}
		}

	}
}