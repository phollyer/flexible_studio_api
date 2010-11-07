package api.tray.setIcon
{
	import flash.events.IEventDispatcher;
	import api.tray.Tray;
	
	[Event(name="missingResource" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetIcon extends Tray
	{
		// Required
		public var resource:String = null;
		
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
					ssCore.Tray.setIcon( {resource:resource}
										,{callback:actionComplete, errorSTR:"setIconError", code:"43003"} );
			}
		}
	}
}