package api.registry.setValue
{
	import flash.events.IEventDispatcher;
	import api.registry.Registry;
	import api.vos.registry.ValueVO;

	[Bindable]
	public class SetValue extends Registry
	{				
		// Required
		public var settings:ValueVO = new ValueVO();
		
		public function SetValue(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setValue():void
		{
			ssCore.Registry.setValue( settings.createObject()
									,{callback:actionComplete, errorSTR:"setValueError", code:"33005"} );
		}
	}
}