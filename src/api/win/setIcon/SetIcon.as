package api.win.setIcon
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Event(name="missingResource" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetIcon extends Win
	{		
		// Optional
		public var forceUpdate:Boolean = true;
		
		// Required
		public var resource:String = null
		
		public function SetIcon(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function setIcon( iconResource:String = null ):void
		{			
			resource = compareStrings( iconResource , resource );
			
			switch( resource )
			{
				case null:
					missingResource();
					break;
				default:
					ssCore.Win.setIcon( {forceUpdate:forceUpdate , resource:resource}
									   ,{callback:actionComplete, errorSTR:"setIconError", code:"6024"} );	
			}
		}
		private function setIconComplete( r:Object , c:Object , e:Object ):void
		{			
			switch( r.success )
			{
				case true:
					var event : SetIconEvent = new SetIconEvent( SetIconEvent.RESULT );
					dispatchEvent( event );
					break;
				case false:
					e.id = "6024";
					dispatchError( WinError.SET_ICON_ERROR , e );
			}
		}
	}
}