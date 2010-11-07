package api.vos.app.showMessageBox
{	
	[Bindable]
	public class ShowMessageBoxVO extends Object
	{
		// Required
		public var prompt:String = null;
		
		// Optional
		public var buttons:String = ShowMessageBoxButtonsVO.OK_ONLY;
		public var defaultButton:String = ShowMessageBoxDefaultButtonsVO.BUTTON_1;
		public var icon:String = ShowMessageBoxIconVO.EXCLAMATION;	
		public var title:String = null;
		
		public function ShowMessageBoxVO()
		{
			super();
		}
	}
}