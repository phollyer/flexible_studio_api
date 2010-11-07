package api.flash.setFlashVars
{
	import flash.events.IEventDispatcher;
	import api.flash.Flash;

	[Event(name="missingFlashVars" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetFlashVars extends Flash
	{
		// Required
		public var vars:String = null;
		
		public function SetFlashVars(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setFlashVars( flashVars:String = null ):void
		{
			vars = compareStrings( flashVars , vars );
			
			switch( vars )
			{
				case null:
					missingVars();
					break;
				default:
					ssCore.Flash.setFlashVars( {vars:vars}
											  ,{callback:actionComplete, errorSTR:"setFlashVarsError", code:"21005"} );					
			}
		}
	}
}