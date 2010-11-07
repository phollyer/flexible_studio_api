package api.popup.getMenu
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.popup.getMenu.GetMenuEvent;
	import api.popup.Popup;
	
	[Event(name="missingName" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.popup.getMenu.GetMenuEvent")]
	[Bindable]
	public class GetMenu extends Popup
	{
		// Required
		public var name:String = null;
		
		// Result
		public var menu:String = null;
		
		public function GetMenu(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getMenu( menuName:String = null ):void
		{
			name = compareStrings( menuName , name );
			
			switch( name )
			{
				case null:
					missingName();
					break;
				default:
					ssCore.Popup.getMenu( {name:name}
										 ,{callback:actionComplete, errorSTR:"getMenuError", code:"31002"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			menu = r.result;
			
			var e : GetMenuEvent = new GetMenuEvent( GetMenuEvent.RESULT );
			e.menu = menu;
			dispatchEvent( e );
		}
	}
}